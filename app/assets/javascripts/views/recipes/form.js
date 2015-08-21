ChefGenius.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],

  tagName: "form",

  className: "form-group",

  events: {
    "click .save": "save",
    "click .upload": "upload"
  },

  upload: function(event) {
    event.preventDefault();
    filepicker.setKey(FP_API_KEY);
    filepicker.pick(
      {
        services: ["COMPUTER", "WEBCAM", "IMAGE_SEARCH", "URL"]
      },

      function(fpImage) {
        this.model.image().set({"url": fpImage.url});
        this.model.image().save({}, {
          success: function() {
            $(".upload").prop("disabled", true);
          }.bind(this)
        });
      }.bind(this)
    );
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
    } else {
      recipeData.tags = [""];
    }
    this.model.set({"image_id": this.model.image().id});
    this.model.set(recipeData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        Backbone.history.navigate("", {trigger: true});
      }.bind(this),
      error: function(model, response, options) {
        debugger
      }.bind(this)
    });
  }
});
