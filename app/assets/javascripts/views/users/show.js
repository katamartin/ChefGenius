ChefGenius.Views.UserShow = Backbone.CompositeView.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.addAnnotationFeed(this.model.annotations());
    this.addRecipeFeed(this.model.recipes());
    this.addCommentFeed(this.model.comments());
  },

  events: {
    "click .nav-tabs li": "loadFeed"
  },

  className: "user-show",

  template: JST["users/show"],

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  loadFeed: function(event) {
    var tab = $(event.currentTarget);
    tab.siblings().removeClass("active");
    $(".feed").removeClass("active")
    var id = tab.attr("id");
    tab.addClass("active");
    $("." + id).addClass("active");
  },

  addAnnotationFeed: function(annotations) {
    var subview = new ChefGenius.Views.AnnotationFeed({
      collection: annotations
    });
    this.addSubview(".annotation-feed", subview);
  },

  addRecipeFeed: function(recipes) {
    var subview = new ChefGenius.Views.RecipeFeed({
      collection: recipes
    });
    this.addSubview(".recipe-feed", subview);
  },

  addCommentFeed: function(comments) {
    var subview = new ChefGenius.Views.CommentFeed({
      collection: comments
    });
    this.addSubview(".comment-feed", subview);
  }
});
