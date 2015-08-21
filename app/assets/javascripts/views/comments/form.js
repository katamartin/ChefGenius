ChefGenius.Views.CommentForm = Backbone.View.extend({
  template: JST["comments/form"],

  tagName: "form",

  events: {
    "click button": "save"
  },

  render: function() {
    var content = this.template({comment: this.model});
    this.$el.html(content);
    return this;
  },

  save: function(event) {
    event.preventDefault();
    var commentData = this.$el.serializeJSON();
    this.model.set(commentData);
    this.model.save({}, {
      success: function() {
        this.collection.add(this.model, {merge: true});
        this.model = new ChefGenius.Models.Comment({
          "commentable_id": this.model.get("commentable_id"),
          "commentable_type": this.model.get("commentable_type"),
          "vote_count": 0
        });
        this.render();
      }.bind(this),
      error: function(model, response, options) {
        var issues = response.responseJSON;
        _(issues).each(function(issue) {
          this.$(".comment.error-container").html(
            "<div class='alert alert-danger' role='alert'>" + issue + "</div>"
          );
        }.bind(this))
      }.bind(this)
    });
  }
});
