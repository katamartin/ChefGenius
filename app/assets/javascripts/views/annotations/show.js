ChefGenius.Views.AnnotationShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.addCommentsIndexView(this.model.comments());
    this.addCommentFormView();
    this.listenTo(this.model, 'sync change:vote_count', this.render);
    this.listenTo(this.model.vote(), 'change', this.render);
  },

  template: JST["annotations/show"],

  className: "annotation-show",

  events: {
    "click .upvote": "upvote",
    "click .downvote": "downvote",
    "click .delete": "delete"
  },

  addCommentFormView: function() {
    var comment = new ChefGenius.Models.Comment();
    comment.set({
      "commentable_id": this.model.get("id"),
      "commentable_type": "Annotation",
      "vote_count": 0
    });
    var subview = new ChefGenius.Views.CommentForm({
      model: comment,
      collection: this.model.comments()
    });
    this.addSubview(".comments-container", subview);
  },

  addCommentsIndexView: function(comments) {
    var subview = new ChefGenius.Views.CommentsIndex({collection: comments});
    this.addSubview(".comments-container", subview);
  },

  render: function() {
    var content = this.template({annotation: this.model});
    this.$el.html(content);
    this.$el.css({
      'top': this.model.get("top"),
    });
    this.attachSubviews();
    return this;
  },

  vote: function(val) {
    if (this.model.isVotedOn() && this.model.vote().get("value") !== val) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: val
      });
      this.model.set({vote_count: this.model.get('vote_count') + 2 * val});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: val
      });
      this.model.set({vote_count: this.model.get("vote_count") + val});
    } else {
      this.model.vote().destroy({
        success: function () {
          this.model.vote().clear();
          this.model.set({vote_count: this.model.get("vote_count") - val});
        }.bind(this)
      });
    }
  },

  upvote: function() {
    this.vote(1);
  },

  downvote: function() {
    this.vote(-1);
  },

  delete: function(event) {
    event.preventDefault();
    var confirmed = confirm("Are you sure you want to delete this annotation?");
    if (confirmed) {
      this.model.recipe().annotations().remove(this.model);
      this.model.destroy();
      this.remove();
    }
  }
});
