ChefGenius.Models.Recipe = Backbone.Model.extend({
  urlRoot: "/api/recipes",

  annotations: function() {
    if (!this._annotations) {
      this._annotations = new ChefGenius.Collections.Annotations([], {recipe: this});
    }
    return this._annotations;
  },

  tags: function() {
    if (!this._tags) {
      this._tags = new ChefGenius.Collections.Tags([], {recipe: this});
    }
    return this._tags;
  },

  comments: function() {
    if (!this._comments) {
      this._comments = new ChefGenius.Collections.Comments([], {recipe: this});
    }
    return this._comments;
  },

  parse: function(response) {
    if (response.annotations) {
      this.annotations().set(response.annotations, {parse: true});
      delete response.annotations;
    }
    if (response.tags) {
      this.tags().set(response.tags, {parse: true});
      delete response.tags;
    }
    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }
    return response;
  },

  fromDomString: function(domString, start, end) {
    var newLinesBefore = domString.slice(0, start).split('\n').length - 1;
    var newLinesBetween = domString.slice(start, end).split('\n').length - 1;
    var trueStart = start - 4 + newLinesBefore;
    var trueEnd = end - 4 + newLinesBefore + newLinesBetween;
    return [trueStart, trueEnd];
  },

  toDomString: function(domString, trueStart, trueEnd) {
    var newLinesBefore = this.get("body").slice(0, trueStart).split('\n').length - 1;
    var newLinesBetween = this.get("body").slice(trueStart, trueEnd).split('\n').length - 1;
    var start = trueStart + 4 - newLinesBefore;
    var end = trueEnd + 4 - newLinesBetween - newLinesBefore;
    return [start, end];
  }
});
