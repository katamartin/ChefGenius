window.ChefGenius = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    $(".guest").on("click", function(event) {
      event.preventDefault();
      $("#user_email").val("guest@chefgenius.io");
      $("#user_password").val("password");
      $(".submit").click();
    });
    var router = new ChefGenius.Routers.Router({
      $rootEl: $("#content"),
      recipes: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags,
      users: ChefGenius.Collections.users
    });

    var nav = new ChefGenius.Views.NavShow({
      router: router,
      collection: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags,
      router: router
    });

    $("#navbar").html(nav.render().$el);

    Backbone.history.start();
  }
};

// $(document).ready(function() {
//   ChefGenius.initialize();
// });
