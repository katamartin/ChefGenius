ChefGenius.Views.RecipeIndexItem = Backbone.View.extend({
  template: JST["recipes/index_item"],

  className: "recipe-index-item",

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    return this;
  },
});
