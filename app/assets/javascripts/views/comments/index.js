ChefGenius.Views.CommentsIndex = Backbone.CompositeView.extend({
  template: JST["comments/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addCommentItemView);
    this.listenTo(this.collection, "remove", this.removeCommentItemView);
    this.collection.each(this.addCommentItemView.bind(this));
  },

  className: "recipe-comments-index",

  addCommentItemView: function(comment) {
    var subview = new ChefGenius.Views.CommentIndexItem({model: comment});
    this.addSubview(".comments", subview);
  },

  removeCommentItemView: function(comment) {
    this.removeModelSubview('.comments', comment);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  }
});
