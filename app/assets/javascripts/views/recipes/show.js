ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["recipes/show"],

  events: {
    "mouseup": "isTextSelected"
  },

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    this.attachSubviews();
    this.attachAnnotationLinks();
    return this;
  },

  isValidRange(start, end) {
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

  addAnnotationFormView: function(annotation) {
    var subview = new ChefGenius.Views.AnnotationForm({
      model: annotation,
      collection: this.model.annotations()
    });
    this.addSubview(".annotation-form", subview);
  },

  isTextSelected: function(event) {
    event.preventDefault();
    var t = (document.all) ? document.selection.createRange().text : document.getSelection();
    if (t.toString() && t.toString().trim().length > 0) {
      var domString = t.anchorNode.wholeText
      var start = t.getRangeAt(0).startOffset;
      var end = t.getRangeAt(0).endOffset;
      var range = this.model.fromDomString(domString, start, end);
      debugger
      if (this.isValidRange(range[0], range[1])) {
        var annotation = new ChefGenius.Models.Annotation();
        annotation.set({"start_idx": range[0],
                        "end_idx": range[1],
                        "recipe_id": this.model.get("id")
                      });
        this.addAnnotationFormView(annotation);
      }
    }
  },

  attachAnnotationLinks: function() {
    var view = this;
    var body = view.$(".recipe-body").text();
    var bodySplit = body.split("");
    this.model.annotations().each(function(annotation) {
      var start = annotation.get("start_idx");
      var end = annotation.get("end_idx");
      var range = view.model.toDomString(body, start, end);
      var id = annotation.get("id");
      bodySplit[range[0]] = "<a href='javascript:void(0)' class='annotation' id='" + id + "'>" + bodySplit[range[0]];
      bodySplit[range[1] - 1] = bodySplit[range[1] - 1] + "</a>";
    });
    this.$(".recipe-body").html(bodySplit.join(""));
  }
});
