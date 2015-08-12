ChefGenius.Models.Recipe = Backbone.Model.extend({
  urlRoot: "/api/recipes",

  annotations: function() {
    if (!this._annotations) {
      this._annotations = new ChefGenius.Collection.Annotations([], {model: this})
    }
    return this._annotations;
  },

  parse: function(response) {
    if (response.annotations) {
      this.annotations().set(response.annotations, {parse: true});
      delete response.annotations;
    }
    return response;
  }
});
