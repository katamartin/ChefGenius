ChefGenius.Views.CommentIndexItem = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, 'sync change:vote_count', this.render);
    this.listenTo(this.model.vote(), 'change destroy', this.render);
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

  vote: function(val) {
    if (this.model.isVotedOn() && this.model.vote().get("value") !== val) {
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
        value: val
      });
      this.model.set({vote_count: this.model.get('vote_count') + 2 * val});
    } else if (!this.model.isVotedOn()){
      this.model.vote().save({
        votable_id: this.model.id,
        votable_type: "Comment",
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
  }
});
