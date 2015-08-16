ChefGenius.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  annotations: function() {
    if (!this._annotations) {
      this._annotations = new ChefGenius.Collections.Annotations(
        [],
        {author: this}
      );
    }
    return this._annotations;
  },

  recipes: function() {
    if (!this._recipes) {
      this._recipes = new ChefGenius.Collections.Recipes(
        [],
        {author: this}
      );
    }
    return this._recipes;
  },

  comments: function() {
    if (!this._comments) {
      this._comments = new ChefGenius.Collections.Comments(
        [],
        {author: this}
      );
    }
    return this._comments;
  },

  parse: function(response) {
    if (response.annotations) {
      this.annotations().set(response.annotations, {parse: true});
      delete response.annotations;
    }
    if (response.recipes) {
      this.recipes().set(response.recipes, {parse: true});
      delete response.recipes;
    }
    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }
    return response;
  }
});
