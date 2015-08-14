ChefGenius.Collections.Comments = Backbone.Collection.extend({
  url: "/api/comments",

  model: ChefGenius.Models.Comment
});
