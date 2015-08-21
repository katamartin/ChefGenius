ChefGenius.Views.AnnotationForm = Backbone.View.extend({
  template: JST["annotations/form"],

  tagName: "form",

  className: "annotation-form",

  events: {
    "click button": "save"
  },

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    this.$el.css({
      'top': this.model.get("top"),
    });
    return this;
  },

  save: function(event) {
    event.preventDefault();
    var annotationData = this.$el.serializeJSON();
    this.model.set(annotationData);
    this.$(".error-container").empty();
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        this.remove();
      }.bind(this),
      error: function(model, response, options) {
        var issues = response.responseJSON;
        _(issues).each(function(issue) {
          this.$(".annotation.error-container").html(
            "<div class='alert alert-danger' role='alert'>" + issue + "</div>"
          );
        }.bind(this))
      }.bind(this)
    });
  }
});
