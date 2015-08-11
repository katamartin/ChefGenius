ChefGenius.Collections.Recipes = Backbone.Collection.extend({
  model: ChefGenius.Models.Recipe,

  url: "/api/recpies"
});

ChefGenius.Collections.recipes = new ChefGenius.Collections.Recipes();
