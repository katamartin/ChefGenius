ChefGenius.Views.AnnotationFeedItem = Backbone.View.extend({
  className: "annotation-feed-item",

  template: JST["annotations/feed_item"],

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    return this;
  }
});
