# Phase 1: User Authentication and Basic Recipes

## Rails
### Models
* User
* Recipe

### Controllers
* UsersController (create, new)
* SessionsController (create, new, destroy)
* RootController (root)
* Api::RecipesController (index, create, show)

### Views
* users/new.html.erb
* session/new.html.erb
* root/root.html.erb
* recipes/show.json.jbuilder
* recipes/index.json.jbuilder

## Backbone
### Models
* Recipe

### Collections
* Recipes

### Views
* RecipeForm
* RecipesIndex (composite view, contains RecipesIndexItem subviews)
* RecipesIndexItem
* RecipeShow

## Gems/Libraries
