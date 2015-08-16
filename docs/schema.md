# Schema Information

## recipes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
body        | text      | not null
image_url   | string    |

## annotations
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
recipe_id   | integer   | not null, foreign key (references recipes)
body        | text      | not null
start_idx   | integer   | not null
end_idx     | integer   | not null

## tags
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
label       | string    | not null, unique

## taggings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
recipe_id   | integer   | not null, foreign key (references recipes)
tag_id      | integer   | not null, foreign key (references tags)

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
image_url       | string    |

## comments
column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
author_id        | integer   | not null, foreign_key (references user)
commentable_id   | integer   | not null, foreign_key (references recipe/annoation)
commentable_type | string    | not null
body             | text      | not null

## votes
###(uniqueness constraint on author_id, votable_id, votable_type combinations)
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
author_id    | integer   | not null, foreign_key (references user)
votable_id   | integer   | not null, foreign_key (references votable)
votable_type | string    | not null
vote         | value     | not null
