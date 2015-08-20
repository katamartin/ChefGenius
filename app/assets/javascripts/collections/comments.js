ChefGenius.Collections.Comments = Backbone.Collection.extend({
  url: "/api/comments",

  model: ChefGenius.Models.Comment,

  comparator: function(comment) {
    return -1 * comment.get("vote_count");
  }
});
