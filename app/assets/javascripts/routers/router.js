ChefGenius.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.recipes = options.recipes;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "recipesIndex"
  },

  recipesIndex: function() {
    this.recipes.fetch();
    var view = new ChefGenius.Views.RecipesIndex({collection: this.recipes});
    this._swapView(view);
  },

  _swapView: function(view) {
    this._view && this._view.remove();
    this._view = view;
    this.$rootEl.html(view.render().$el);
  }
});
