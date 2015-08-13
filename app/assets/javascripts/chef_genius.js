window.ChefGenius = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ChefGenius.Routers.Router({
      $rootEl: $("#content"),
      recipes: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags
    });
    Backbone.history.start();
  }
};
