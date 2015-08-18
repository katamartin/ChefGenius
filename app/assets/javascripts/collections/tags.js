ChefGenius.Collections.Tags = Backbone.Collection.extend({
  model: ChefGenius.Models.Tag,

  url: "/api/tags",

  comparator: function(tag) {
    return tag.get("count") * -1;
  },

  getOrFetch: function(id) {
    var tag = this.get(id);
    if (!tag) {
      tag = new ChefGenius.Models.Tag({id: id});
      tag.fetch({
        error: function() {
          this.remove(tag);
        }.bind(this)
      });
    } else {
      tag.fetch();
    }
    return tag;
  }
});

ChefGenius.Collections.tags = new ChefGenius.Collections.Tags();
