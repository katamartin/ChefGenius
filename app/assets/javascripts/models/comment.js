ChefGenius.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",

  recipe: function() {
    if (!this._recipe) {
      this._recipe = new ChefGenius.Models.Recipe();
    }
    return this._recipe;
  },

  annotation: function() {
    if (!this._annotation) {
      this._annotation = new ChefGenius.Models.Annotation();
    }
    return this._annotation;
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
    if (response.annotation) {
      this.commentable = "annotation";
      this.annotation().set(response.annotation, {parse: true});
      this.annotation().recipe().set(response.annotation.recipe);
      delete response.annotation
    }
    if (response.recipe) {
      this.commentable = "recipe";
      this.recipe().set(response.recipe, {parse: true});
      delete response.recipe;
    }
    if (response.vote) {
      this.vote().set(response.vote, {parse: true});
      delete response.vote;
    }
    return response;
  }
});
