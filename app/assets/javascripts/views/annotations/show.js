ChefGenius.Views.AnnotationShow = Backbone.View.extend({
  template: JST["show"],

  className: "annotation-show",

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    return this;
  }
});
