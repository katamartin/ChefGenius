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
    new ChefGenius.Routers.Router({
      $rootEl: $("#content"),
      recipes: ChefGenius.Collections.recipes,
      tags: ChefGenius.Collections.tags,
      users: ChefGenius.Collections.users
    });
    Backbone.history.start();
  }
};

$(document).ready(function() {
  ChefGenius.initialize();
});
