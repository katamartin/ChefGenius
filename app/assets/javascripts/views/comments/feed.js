ChefGenius.Views.CommentFeed = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addCommentView);
    this.listenTo(this.collection, "remove", this.removeCommentView);
    this.collection.each(this.addCommentView.bind(this));
  },

  template: JST["comments/feed"],

  addCommentView: function(comment) {
    var subview = new ChefGenius.Views.CommentFeedItem({model: comment});
    this.unshiftSubview(".comments", subview);
  },

  removeCommentView: function(comment) {
    this.removeModelSubview('.comments', comment);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  }
});
