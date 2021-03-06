ChefGenius.Models.Annotation = Backbone.Model.extend({
  urlRoot: "/api/annotations",

  recipe: function() {
    if (!this._recipe) {
      this._recipe = new ChefGenius.Models.Recipe();
    }
    return this._recipe;
  },

  comments: function() {
    if (!this._comments) {
      this._comments = new ChefGenius.Collections.Comments([], {annotation: this});
    }
    return this._comments;
  },

  vote: function() {
    if (!this._vote) {
      this._vote = new ChefGenius.Models.Vote();
    }
    return this._vote;
  },

  isVotedOn: function() {
    return !this.vote().isNew();
  },

  parse: function(response) {
    if (response.recipe) {
      this.recipe().set(response.recipe, {parse: true});
      delete response.recipe;
    }
    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }
    if (response.vote) {
      this.vote().set(response.vote, {parse: true});
      delete response.vote;
    }
    return response;
  }
});
