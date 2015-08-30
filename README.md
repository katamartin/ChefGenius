# Chef Genius

[Live Link][live]

[live]: http://chefgeni.us

## Summary
Chef Genius is a full-stack web app built with Rails and Backbone. Chef Genius
allows users to create, share, and annotate recipes. Annotations are created by
simply highlighting recipe text and submitting annotation content. Users can
also comment on recipes and annotations, vote on content, and view users'
activity feeds.

## Minimum Viable Product
Chef Genius is a clone of Rap Genius for recipe annotation built on Rails and
Backbone. Users can:
<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Create recipes
- [x] Annotate recipes
- [x] Tag recipes
- [x] View recipes by tag
- [x] Comment on recipes
- [x] View users' activity
- [x] Reply to annotations
- [x] Vote on annotations and replies
- [x] Search for recipes
- [x] Guest login

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Recipe Creation (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. Recipes will be created using a Backbone view, and seen both
at the Rails API and Backbone home links. The app will be pushed to Heroku and
this functionality will be confirmed before moving on.

[Details][phase-one]

### Phase 2: Viewing Recipes, Comments, and Tags (~2 days)
The initial RecipeShow view will be extended to contain the views for creating
and viewing annotations for the visited recipe. The AnnotationForm view will be
toggled by highlighting valid sections of the recipe body.

[Details][phase-two]

### Phase 3: Tagging and Commenting on Recipes (~2 days)
The taggings, tags, and comments associations will be added to the recipe model.
Backbone views will subsequently be added such that the collection of recipes
having a particular tag may be accessed at once. Also, the RecipeShow view will
be edited to contain the comments on a particular recipe.

[Details][phase-three]

### Phase 4: User Show (~1 day)
A user show page will be added to the one-page app. This will contain links to
the recipes associated with a particular user: recipes posted by the user
(recipes with author_id = user.id) and recipes annotated by the user (containing
annotation with author_id = user.id).

[Details][phase-four]

### Phase 5: Replying to and voting on Annotations (~1 day)
The annotation show will be further fleshed out to contain a form for submitting
replies, the posted replies, and buttons to up/downvote replies and the
annotation itself. A user's votes will be tracked (in the votes join table) so
that they may send one vote for each votable.

[Details][phase-five]

### Phase 6: Searching for Recipes (~1 day)
A `search` route will be added to the recipe controller. In the simplest
implementation, a search query will return a simple view containing all recipes
whose titles contain the search query. This will reuse the the RecipesIndex and
RecipesIndexItem views built in earlier phases. A more complicated
implementation might immediately show links to relevant recipes in the
navigation bar.

[Details][phase-six]

### Bonus Features (TBD)
- [ ] Use Markdown for better recipe formatting
- [x] Typeahead/real-time search bar
- [ ] Pagination/infinite scroll for recipe index
- [ ] Multiple sessions/session management
- [ ] User avatars (Gravatar)

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
