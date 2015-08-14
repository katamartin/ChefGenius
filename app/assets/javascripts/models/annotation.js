ChefGenius.Models.Annotation = Backbone.Model.extend({
  urlRoot: "/api/annotations",

  recipe: function() {
    if (!this._recipe) {
      this._recipe = new ChefGenius.Models.Recipe();
    }
    return this._recipe;
  },

  parse: function(response) {
    if (response.recipe) {
      this.recipe().set(response.recipe, {parse: true});
      delete response.recipe;
    }
    return response;
  }
});
