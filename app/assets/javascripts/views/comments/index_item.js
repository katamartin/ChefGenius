ChefGenius.Views.CommentIndexItem = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, 'sync change:vote_count', this.render);
    this.listenTo(this.model.vote(), 'change', this.render);
  },

  template: JST["comments/index_item"],

  events: {
    "click .upvote": "upvote",
    "click .downvote": "downvote"
  },

  className: "comment-index-item",

  render: function() {
    var content = this.template({comment: this.model});
    this.$el.html(content);
    return this;
  },

  upvote: function() {
    if (this.model.isVotedOn() && this.model.vote().get("value") === -1) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
        value: 1
      });
      this.model.set({vote_count: this.model.get('vote_count') + 2});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
        value: 1
      });
      this.model.set({vote_count: this.model.get("vote_count") + 1});
    }
  },

  downvote: function() {
    if (this.model.isVotedOn() && this.model.vote().get("value") === 1) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
        value: -1
      });
      this.model.set({vote_count: this.model.get('vote_count') - 2});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
        value: -1
      });
      this.model.set({vote_count: this.model.get("vote_count") - 1});
    }
  }
});
