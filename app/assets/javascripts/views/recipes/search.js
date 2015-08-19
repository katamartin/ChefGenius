ChefGenius.Views.RecipeSearch = Backbone.CompositeView.extend({
  initialize: function() {
    this.collection.each(this.addRecipeItemView.bind(this));
  },

  className: "recipes-search",

  template: JST["recipes/search"],

  addRecipeItemView: function(recipe) {
    var subview = new ChefGenius.Views.RecipeIndexItem({model: recipe});
    this.addSubview(".recipes", subview);
  },

  render: function() {
    this.$el.html(this.template());
    if (this.collection.length === 0) {
      this.$el.append("<h1>Sorry, no recipes found.</h1>");
    }
    this.attachSubviews();
    return this;
  }
});
