ChefGenius.Views.AnnotationForm = Backbone.View.extend({
  template: JST["annotations/form"],

  tagName: "form",

  events: {
    "click button": "save"
  },

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    return this;
  },

  save: function(event) {
    event.preventDefault();
    var annotationData = this.$el.serializeJSON();
    this.model.set(annotationData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        this.remove();
      }.bind(this)
    });
  }
});
