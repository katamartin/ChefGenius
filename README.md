# Chef Genius

[Live Link][live]

[live]: http://www.chefgeni.us

## Summary
Chef Genius is a full-stack web app built with Rails and Backbone. Chef Genius
allows users to create, share, and annotate recipes. Annotations are created by
simply highlighting recipe text and submitting annotation content. Users can
also comment on recipes and annotations, vote on content, and view users'
activity feeds.

### Landing Page
![landing]

### Annotation View
![annotation]

[landing]: ./docs/screenshots/landing.png
[annotation]: ./docs/screenshots/annotation_view.png

## Interpreting Text Selection
Highlighting text within recipe body triggers annotation creation. Because
annotations are stored with the start and end indices corresponding to positions
in the recipe body, text selection events are examined to extract this data.
Given text selection `t`, the start index (or offset) is computed:

```
getStartOffset: function(t) {
  var node = t.anchorNode.parentNode.firstChild;
  var count = 0;
  while (!node.isEqualNode(t.anchorNode)) {
    count += node.textContent.length;
    node = node.nextSibling;
  }
  return t.getRangeAt(0).startOffset + count;
}
```
The parent node's children must be iterated through to work around the embedded
links in the recipe body, summing the numbers of characters preceding the
highlighted text. Finding the end index (or offset) is then trivial, as `t`
provides the length of the annotation string.


## Eager Loading
Content-rich pages like recipe show pages render data from recipes many nested
associations. To accomplish this quickly, eager loading is utilized server-side:

```
def show
  @recipe = Recipe.
    includes(
      :author,
      :image,
      :tags,
      annotations: [:votes, :author, comments: [:votes, :author]],
      comments: [:votes, :author]
    ).
    find(params[:id])
  render :show
end
```

The JSON API view may then immediately provide the dense data already retrieved
from the database:

```
json.extract! @recipe, :title, :body, :id, :author_id
json.author @recipe.author.email
if @recipe.image
  json.image @recipe.image, :id, :url
end
json.annotations @recipe.annotations, partial: 'api/annotations/annotation', as: :annotation
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments, partial: 'api/comments/comment', as: :comment
```

## Minimum Viable Product
Chef Genius is a clone of Rap Genius for recipe annotation built on Rails and
Backbone. Users can:

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
