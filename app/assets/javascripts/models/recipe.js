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

  parse: function(response) {
    if (response.annotations) {
      this.annotations().set(response.annotations, {parse: true});
      delete response.annotations;
    }

    if (response.tags) {
      this.tags().set(response.tags, {parse: true});
      delete response.tags;
    }
    return response;
  },

  fromDomString: function(domString, start, end) {
    var newLinesBefore = domString.slice(0, start).split('\n').length - 1;
    var newLinesBetween = domString.slice(start, end).split('\n').length - 1;
    var trueStart = start - 2 + newLinesBefore;
    var trueEnd = end - 2 + newLinesBefore + newLinesBetween;
    return [trueStart, trueEnd];
  },

  toDomString: function(domString, trueStart, trueEnd) {
    var newLinesBefore = this.get("body").slice(0, trueStart).split('\n').length - 1;
    var newLinesBetween = this.get("body").slice(trueStart, trueEnd).split('\n').length - 1;
    var start = trueStart + 2 - newLinesBefore;
    var end = trueEnd + 2 - newLinesBetween - newLinesBefore;
    return [start, end];
  }
});
