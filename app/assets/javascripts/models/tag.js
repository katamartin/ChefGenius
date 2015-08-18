ChefGenius.Models.Tag = Backbone.Model.extend({

  urlRoot: "/api/tags",

  recipes: function() {
    if (!this._recipes) {
      this._recipes = new ChefGenius.Collections.Recipes([], {tag: this});
    }
    return this._recipes;
  },

  parse: function(response) {
    if (response.recipes) {
      this.recipes().set(response.recipes, {parse: true});
      delete response.recipes;
    }
    return response;
  }

});
