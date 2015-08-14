ChefGenius.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",

  model: ChefGenius.Models.User,

  getOrFetch: function(id) {
    var user = this.get(id);
    if (!user) {
      user = new ChefGenius.Models.User({id: id});
      this.add(user);
      user.fetch({
        error: function() {
          this.remove(user);
        }.bind(this)
      });
    } else {
      user.fetch();
    }
    return user;
  }
});

ChefGenius.Collections.users = new ChefGenius.Collections.Users();
