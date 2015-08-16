ChefGenius.Views.CommentFeedItem = Backbone.View.extend({
  className: "comment-feed-item",

  template: JST["comments/feed_item"],

  render: function() {
    var content = this.template({comment: this.model});
    this.$el.html(content);
    return this;
  }
});
