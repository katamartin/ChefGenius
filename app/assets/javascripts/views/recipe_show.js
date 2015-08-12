ChefGenius.Views.RecipeShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["recipes/show"],

  events: {
    "mouseup": "isTextSelected"
  },

  render: function() {
    var content = this.template({recipe: this.model});
    this.$el.html(content);
    return this;
  },

  isValidRange(start, end) {
    var overlapping = false;
    this.model.annotations.each(function(annotation){
      var start_idx = annotation.get("start_idx");
      var end_idx = annotation.get("end_idx");
      if ( start_idx <= end || end_idx >= start ) {
        overlapping = true;
      }
    });

    return overlapping;
  },

  isTextSelected: function() {
    var t = (document.all) ? document.selection.createRange().text : document.getSelection();
    if (t.toString() && t.toString().trim().length > 0) {
      var domString = t.anchorNode.wholeText
      var start = t.getRangeAt(0).startOffset;
      var end = t.getRangeAt(0).endOffset;
      var newLinesBefore = domString.slice(0, start).split('\n').length - 1;
      var newLinesBetween = domString.slice(start, end).split('\n').length - 1;
      var trueStart = start - 2 + newLinesBefore;
      var trueEnd = end - 2 + newLinesBefore + newLinesBetween;
      // var range = [trueStart, trueEnd];
      if this.isValidRange(trueStart, trueEnd) {
        debugger
      }
      // var selection = this.model.get("body").slice(trueStart, trueEnd);
      // debugger
    }
  }
});
