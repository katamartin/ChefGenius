ChefGenius.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.recipes = options.recipes;
    this.tags = options.tags;
    this.users = options.users;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "recipesIndex",
    "recipes/search/:query": "recipeSearch",
    "recipes/new": "newRecipe",
    "recipes/:id": "showRecipe",
    "tags/:id": "showTag",
    "users/:id": "showUser",
    "about": "about"
  },

  about: function () {
    var view = new ChefGenius.Views.About();
    this._swapView(view);
  },

  recipeSearch: function(query) {
    this.recipes.fetch({
      data: {query: query},
      success: function() {
        var view = new ChefGenius.Views.RecipeSearch({collection: this.recipes});
        this._swapView(view);
      }.bind(this)
    });
    $(".query-value").val("");
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
    $('body').scrollTop(0);
    this._view && this._view.remove();
    this._view = view;
    this.$rootEl.html(view.render().$el);
    if (this.$rootEl.find(".nav-overlap").length === 0) {
      this.$rootEl.prepend("<div class='empty-nav-overlap'></div>");
    }
  }
});
