ChefGenius.Views.RecipeFeed = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync add remove", this.render);
  },

  template: JST["recipes/feed"],

  render: function() {
    var content = this.template({recipes: this.collection});
    this.$el.html(content);
    return this;
  }
});
