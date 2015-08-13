ChefGenius.Views.AnnotationShow = Backbone.View.extend({
  template: JST["annotations/show"],

  tagName: "pre",
  
  className: "annotation-show",

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    return this;
  }
});