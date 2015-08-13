ChefGenius.Collections.Recipes = Backbone.Collection.extend({
  model: ChefGenius.Models.Recipe,

  url: "/api/recipes",

  getOrFetch: function(id) {
    var recipe = this.get(id);
    if (!recipe) {
      recipe = new ChefGenius.Models.Recipe({id: id});
      this.add(recipe);
      recipe.fetch({
        error: function() {
          this.remove(recipe);
        }.bind(this)
      });
    } else {
      recipe.fetch();
    }
    return recipe;
  }
});

ChefGenius.Collections.recipes = new ChefGenius.Collections.Recipes();
