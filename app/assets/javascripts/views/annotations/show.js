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
    "click .downvote": "downvote"
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

  upvote: function() {
    if (this.model.isVotedOn() && this.model.vote().get("value") === -1) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: 1
      });
      this.model.set({vote_count: this.model.get('vote_count') + 2});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: 1
      });
      this.model.set({vote_count: this.model.get("vote_count") + 1});
    }
  },

  downvote: function() {
    if (this.model.isVotedOn() && this.model.vote().get("value") === 1) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: -1
      });
      this.model.set({vote_count: this.model.get('vote_count') - 2});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Annotation",
        value: -1
      });
      this.model.set({vote_count: this.model.get("vote_count") - 1});
    }
  }
});
