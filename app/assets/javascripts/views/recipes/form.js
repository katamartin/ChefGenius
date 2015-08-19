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
    var image = new ChefGenius.Models.Image();
    filepicker.setKey(FP_API_KEY);
    filepicker.pick(
      {
        services: ["COMPUTER", "WEBCAM", "IMAGE_SEARCH", "URL"]
      },

      function(fpImage) {
        image.set({"url": fpImage.url});
        image.save({}, {
          success: function() {
            this.model.images().add(image);
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
    }
    this.model.set({"image_ids": this.model.images().pluck("id")});
    this.model.set(recipeData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        Backbone.history.navigate("", {trigger: true});
      }.bind(this)
    });
  }
});
