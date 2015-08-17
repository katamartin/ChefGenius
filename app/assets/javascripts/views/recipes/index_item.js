ChefGenius.Views.RecipeIndexItem = Backbone.View.extend({
  template: JST["recipes/index_item"],

  className: "recipe-index-item",

  events: {
    "click": "show"
  },

  render: function() {
    debugger
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    return this;
  },

  show: function(event) {
    event.preventDefault();
    var url = "/recipes/" + this.model.escape("id");
    Backbone.history.navigate(url, {trigger: true});
  }
});
