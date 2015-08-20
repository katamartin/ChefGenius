ChefGenius.Views.TagShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.recipes(), "add", this.addRecipeItemView);
    this.listenTo(this.model.recipes(), "remove", this.removeRecipeItemView);
    this.model.recipes().each(this.addRecipeItemView.bind(this));
  },

  className: "tag-show",

  template: JST["tags/show"],

  addRecipeItemView: function(recipe) {
    var subview = new ChefGenius.Views.RecipeIndexItem({model: recipe});
    this.addSubview(".recipes", subview);
  },

  removeRecipeItemView: function(recipe) {
    this.removeModelSubview('.recipes', recipe);
  },

  render: function() {
    this.$el.html(this.template({tag: this.model}));
    this.attachSubviews();
    return this;
  }
});
