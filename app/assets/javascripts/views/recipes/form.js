ChefGenius.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],

  tagName: "form",

  className: "form-group",

  events: {
    "click .save": "save"
  },

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    this.$('.tag-field').tokenfield();
    return this;
  },

  save: function(event) {
    event.preventDefault();
    var recipeData = this.$el.serializeJSON();
    if (recipeData.tags) {
      recipeData.tags = recipeData.tags.split(", ");
    }
    this.model.set(recipeData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        Backbone.history.navigate("", {trigger: true});
      }.bind(this)
    });
  }
});
