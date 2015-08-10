# Phase 2: Create and Show Recipe Annotations

## Rails
### Models
* Annotation

### Controllers
Api::AnnotationsController (create, destroy, index, show)

### Views
* annotations/show.json.jbuilder

## Backbone
### Models
* Annotations

### Collections
* Annotations

### Views
* RecipeShow (composite view, contains AnnotationsIndex/Form subviews)
* AnnotationForm
* AnnotationShow

## Gems/Libraries
