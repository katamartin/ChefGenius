ChefGenius.Views.NavShow = Backbone.View.extend({
  template: JST["nav"],

  initialize: function (options) {
    this.router = options.router;
    this.tags = options.tags;
    this.tags.fetch({
      success: function() {
        this.updatePopularTags();
      }.bind(this)
    });
    this.listenTo(this.router, "route", this.handleRoute);
    this.listenTo(this.collection, "add remove", this.updateCount);
    window.nav = this;
  },

  events: {
    "click .logout": "endSession"
  },

  handleRoute: function (routeName, params) {
    this.$el.find(".active").removeClass("active");
    this.$el.find("." + routeName).addClass("active");
  },

  updatePopularTags: function () {
    this.topFive = this.tags.slice(0, 5);
    this.render();
  },

  render: function () {
    var content = this.template({
      top_five: this.topFive
    });
    this.$el.html(content);
    return this;
  },

  endSession: function(event) {
    event.preventDefault();
    $.ajax({
      url: "/session",
      method: "delete",
      success: function(data) {
        window.location = "";
      }
    });
  }
});
