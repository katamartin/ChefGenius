ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model, "sync", this.addCommentsIndexView);
    this.listenTo(this.model.annotations(), "add", this.attachAnnotationLink);
    this.listenTo(this.model.annotations(), "add", this.addNewAnnotationView);
    this.addCommentFormView();
  },

  template: JST["recipes/show"],

  events: {
    "mouseup .recipe-body": "isTextSelected",
    "click .annotation": "addAnnotationView",
    "click .delete": "delete"
  },

  render: function() {
    this.emptyContainer(".annotation-container");
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    this.attachSubviews();
    this.attachAnnotationLinks();
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
    return this;
  },

  isValidRange: function(start, end) {
    var valid = true;
    this.model.annotations().each(function(annotation){
      var start_idx = annotation.get("start_idx");
      var end_idx = annotation.get("end_idx");
      if ( (start_idx < end && end_idx >= end) ||
           (start_idx <= start && end_idx > start) ) {
        valid = false;
      }
    });
    return valid;
  },

  addCommentsIndexView: function() {
    var comments = this.model.comments();
    var subview = new ChefGenius.Views.CommentsIndex({collection: comments});
    this.unshiftSubview(".comments-container", subview);
  },

  addAnnotationFormView: function(annotation) {
    var subview = new ChefGenius.Views.AnnotationForm({
      model: annotation,
      collection: this.model.annotations()
    });
    this.emptyContainer(".annotation-container");
    this.addSubview(".annotation-container", subview);
  },

  addCommentFormView: function() {
    var comment = new ChefGenius.Models.Comment();
    comment.set({
      "commentable_id": this.model.get("id"),
      "commentable_type": "Recipe",
      "vote_count": 0
    });
    var subview = new ChefGenius.Views.CommentForm({
      model: comment,
      collection: this.model.comments()
    });
    this.addSubview(".comments-container", subview);
  },

  isValidSelection: function(t) {
    if (!(t.toString()) || t.toString().trim().length === 0) {
      return false;
    } else {
      var containsAnnotation = !t.extentNode.isEqualNode(t.anchorNode);
      var overlapsAnnotation = t.extentNode.parentNode.tagName !== "P";
      return !(containsAnnotation || overlapsAnnotation);
    }
  },

  isTextSelected: function(event) {
    event.preventDefault();
    var t = (document.all) ? document.selection.createRange().text : document.getSelection();
    if (this.isValidSelection(t)) {
      var selection = t.toLocaleString();
      var domString = t.anchorNode.parentNode.innerText;
      var start = this.getStartOffset(t);
      var end = start + selection.length;
      var range = this.model.fromDomString(domString, start, end);
      var top = event.offsetY; // + $(".recipe-image").height();
      if (this.isValidRange(range[0], range[1])) {
        var annotation = new ChefGenius.Models.Annotation();
        annotation.set({"start_idx": range[0],
                        "end_idx": range[1],
                        "recipe_id": this.model.get("id"),
                        "top": top,
                        "vote_count": 0
                      });
        this.addAnnotationFormView(annotation);
      }
    } else {
      this.emptyContainer(".annotation-container");
    }
  },

  attachAnnotationLinks: function() {
    var view = this;
    var body = view.$(".recipe-body").text();
    if (!body.trim()) { return; }
    this.bodySplit = this.bodySplit || body.split("");
    this.model.annotations().each(function(annotation) {
      view.addAnnotationLink(annotation, body);
    });
    this.$(".recipe-body").html(this.bodySplit.join(""));
  },

  addAnnotationLink: function(annotation, domString) {
    if (!domString.trim()) { return; }
    var start = annotation.get("start_idx");
    var end = annotation.get("end_idx");
    var range = this.model.toDomString(domString, start, end);
    var id = annotation.get("id");
    var tag = "<a href='javascript:void(0)' class='annotation' id='" + id + "'>";
    this.bodySplit[range[0]] = tag + this.bodySplit[range[0]];
    this.bodySplit[range[1] - 1] = this.bodySplit[range[1] - 1] + "</a>";
  },

  attachAnnotationLink: function(annotation) {
    var domString = this.$(".recipe-body").text()
    if (!domString.trim()) { return; }
    this.addAnnotationLink(annotation, domString);
    this.$(".recipe-body").html(this.bodySplit.join(""));
  },

  getStartOffset: function(t) {
    var node = t.anchorNode.parentNode.firstChild;
    var count = 0;
    while (!node.isEqualNode(t.anchorNode)) {
      count += node.textContent.length;
      node = node.nextSibling;
    }
    return t.getRangeAt(0).startOffset + count;
  },

  addNewAnnotationView: function(annotation) {
    this.emptyContainer(".annotation-container");
    $(".annotation#" + annotation.id).click();
  },

  addAnnotationView: function(event) {
    event.preventDefault();
    var target = $(event.currentTarget);
    var annotation = this.model.annotations().getOrFetch(target.attr("id"));
    annotation.set("top", target.offset().top - $(".recipe-column").offset().top);
    var subview = new ChefGenius.Views.AnnotationShow({model: annotation});
    this.emptyContainer(".annotation-container");
    this.addSubview(".annotation-container", subview);
  },

  emptyContainer: function(selector) {
    this.$(selector).empty();
    _(this.subviews(selector)).each(function(subview) {
      this.removeSubview(selector, subview);
    }.bind(this));
  },

  delete: function(event) {
    event.preventDefault();
    var confirmed = confirm("Are you sure you want to delete this recipe?");
    if (confirmed) {
      this.model.destroy();
      this.remove();
      Backbone.history.navigate("#", {trigger: true});
    }
  }
});
