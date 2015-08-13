ChefGenius.Collections.Annotations = Backbone.Collection.extend({
  url: "/api/annotations",

  model: ChefGenius.Models.Annotation,

  getOrFetch: function(id) {
    var annotation = this.get(id);
    if (!annotation) {
      annotation = new ChefGenius.Models.Annotation({id: id});
      this.add(annotation);
      annotation.fetch({
        error: function() {
          this.remove(annotation);
        }.bind(this)
      });
    } else {
      annotation.fetch();
    }
    return annotation;
  }
});
