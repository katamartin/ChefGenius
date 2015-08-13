# Phase 3: Tagging and Commenting on Recipes

## Rails
### Models
* Tag
* Tagging
* Comment

### Controllers
* Api::TagsController (create, show, index)
* Api::TaggingsController (create)
* Api::CommentsController (create, destroy)

### Views
* tags/index.json.jbuilder
* tags/show.json.jbuilder

## Backbone
### Models
  * Tag
  * Comment

### Collections
  * Tags
  * Comments

### Views
* TagForm
* TagShow (composite view, contains RecipeIndexItem subview)
* CommentForm
* CommentsIndex (composite view, contains CommentsIndexItem subview)
* CommentsIndexItem
* RecipeShow (expand composite view to contain CommentsIndex subview)


## Gems/Libraries
* bootstrap-tokenfield
