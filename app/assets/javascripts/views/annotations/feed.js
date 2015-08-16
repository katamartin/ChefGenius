ChefGenius.Views.AnnotationFeed = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addAnnotationView);
    this.listenTo(this.collection, "remove", this.removeAnnotationView);
    this.collection.each(this.addAnnotationView.bind(this));
  },

  template: JST["annotations/feed"],

  addAnnotationView: function(annotation) {
    var subview = new ChefGenius.Views.AnnotationFeedItem({model: annotation});
    this.unshiftSubview(".annotations", subview);
  },

  removeAnnotationView: function(annotation) {
    this.removeModelSubview('.annotations', subview);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  }
});
