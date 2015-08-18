window.ChefGenius = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new ChefGenius.Routers.Router({
      $rootEl: $("#content"),
      recipes: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags,
      users: ChefGenius.Collections.users
    });

    var nav = new ChefGenius.Views.NavShow({
      router: router,
      collection: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags
    });

    $("#navbar").html(nav.$el);
    nav.render();
    Backbone.history.start();
  }
};
