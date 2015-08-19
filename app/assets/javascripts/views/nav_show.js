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
  },

  events: {
    "click .logout": "endSession",
    "blur .query-value": "clearQuery",
    "click #search": "search"
  },

  handleRoute: function (routeName, params) {
    this.$el.find(".active").removeClass("active");
    this.$el.find("." + routeName).addClass("active");
  },

  updatePopularTags: function () {
    this.topFive = this.tags.slice(0, 5);
    this.render();
  },

  clearQuery: function(event) {
    if (!event.relatedTarget || event.relatedTarget.id !== "search") {
      event.preventDefault();
      $(event.currentTarget).val("");
    } else {
      this.search(event);
    }
  },

  render: function () {
    var content = this.template({
      top_five: this.topFive
    });
    this.$el.html(content);
    this.addTypeahead();
    return this;
  },

  addTypeahead: function() {
    $.get("/api/recipes/search", function(data){
      $(".query-value").typeahead({
        source: data,
        highlighter: function(name) {
          var recipe = _.find(data, function(p) {
            return p.name == name;
          });
          return recipe.name + " by " + recipe.author;
        },

        updater: function(recipe) {
          $(".query-value").blur();
          Backbone.history.navigate("#/recipes/" + recipe.id, {trigger: true});
          return "";
        }
      });
    },'json');
  },

  search: function(event) {
    event.preventDefault();
    var val = $(".query-value").val()
    Backbone.history.navigate("#/recipes/search/" + val, {trigger: true});
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
