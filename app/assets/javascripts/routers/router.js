ChefGenius.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.recipes = options.recipes;
    this.tags = options.tags;
    this.users = options.users;
    // this.tags.fetch();
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "recipesIndex",
    "recipes/new": "newRecipe",
    "recipes/:id": "showRecipe",
    "tags/:id": "showTag",
    "users/:id": "showUser"
  },

  newRecipe: function() {
    var recipe = new ChefGenius.Models.Recipe();
    var view = new ChefGenius.Views.RecipeForm({model: recipe,
                                                collection: this.recipes
                                              });
    this._swapView(view);
  },

  recipesIndex: function() {
    this.recipes.fetch();
    var view = new ChefGenius.Views.RecipesIndex({collection: this.recipes});
    this._swapView(view);
  },

  showRecipe: function(id) {
    var recipe = this.recipes.getOrFetch(id);
    var view = new ChefGenius.Views.RecipeShow({model: recipe});
    this._swapView(view);
  },

  showTag: function(id) {
    var tag = this.tags.getOrFetch(id);
    var view = new ChefGenius.Views.TagShow({model: tag});
    this._swapView(view);
  },

  showUser: function(id) {
    var user = this.users.getOrFetch(id);
    var view = new ChefGenius.Views.UserShow({model: user});
    this._swapView(view);
  },

  _swapView: function(view) {
    this._view && this._view.remove();
    this._view = view;
    this.$rootEl.html(view.render().$el);
  }
});
