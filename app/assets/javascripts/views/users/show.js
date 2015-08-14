ChefGenius.Views.UserShow = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .nav-tabs li": "loadFeed"
  },

  className: "user-show",

  template: JST["users/show"],

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  loadFeed: function(event) {
    var tab = $(event.currentTarget);
    tab.siblings().removeClass("active");
    tab.addClass("active");
  }
});
