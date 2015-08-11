ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["recipes/show"],

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    return this;
  }
});
