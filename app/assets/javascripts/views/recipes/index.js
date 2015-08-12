ChefGenius.Views.RecipesIndex = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addRecipeItemView);
    this.listenTo(this.collection, "remove", this.removeRecipeItemView);
    this.collection.each(this.addRecipeItemView.bind(this));
  },

  className: "recipes-index",

  template: JST["recipes/index"],

  addRecipeItemView: function(recipe) {
    var subview = new ChefGenius.Views.RecipeIndexItem({model: recipe});
    this.addSubview(".annotation-form", subview);
  },

  removeRecipeItemView: function(recipe) {
    this.removeModelSubview('.recipes', recipe);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  }
});
