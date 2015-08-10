# Phase 5: Reply and Vote on Annotations

## Rails
### Models
* Reply
* Vote

### Controllers
* Api::RepliesController (create, destroy)
* Api::VotesController (create, destroy, edit)

### Views

## Backbone
### Models

### Collections

### Views
* SearchShow (composite view, contains BlogsIndex and PostsIndex subviews)
* AnnotationShow (extend composite view to contain VoteForm and Reply subviews)
* ReplyForm
* ReplyIndex (composite view, contains ReplyIndexItem subview)
* ReplyIndexItem (composite view, contains VoteForm subview)
* VoteForm

## Gems/Libraries
