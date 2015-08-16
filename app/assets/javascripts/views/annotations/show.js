ChefGenius.Views.AnnotationShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.addCommentsIndexView(this.model.comments());
    this.addCommentFormView();
  },

  template: JST["annotations/show"],

  // tagName: "pre",

  className: "annotation-show",

  addCommentFormView: function() {
    var comment = new ChefGenius.Models.Comment();
    comment.set({
      "commentable_id": this.model.get("id"),
      "commentable_type": "Annotation"
    });
    var subview = new ChefGenius.Views.CommentForm({
      model: comment,
      collection: this.model.comments()
    });
    this.addSubview(".comments-container", subview);
  },

  addCommentsIndexView: function(comments) {
    var subview = new ChefGenius.Views.CommentsIndex({collection: comments});
    this.addSubview(".comments-container", subview);
  },

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    this.$el.css({
      'top': this.model.get("top"),
    });
    this.attachSubviews();
    return this;
  }
});
