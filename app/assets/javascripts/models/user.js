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

  parse: function(response) {
    if (response.annotations) {
      this.annotations().set(response.annotations, {parse: true});
      delete response.annotations;
    }
    return response;
  }
});
