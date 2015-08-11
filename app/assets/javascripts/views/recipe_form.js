ChefGenius.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],

  tagName: "form",

  events: {
    "click button": "save"
  },

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    return this;
  },

  save: function(event) {
    event.preventDefault();
    var recipeData = this.$el.serializeJSON();
    this.model.set(recipeData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        Backbone.history.navigate("", {trigger: true});
      }.bind(this)
    });
  }
});
