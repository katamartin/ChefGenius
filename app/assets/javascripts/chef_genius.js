window.ChefGenius = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ChefGenius.Routers.Router({
      $rootEl: $("#content"),
      recipes: ChefGenius.Collections.recipes
    });
    Backbone.history.start();
  }
};

// $(document).ready(function(){
//   ChefGenius.initialize();
// });
