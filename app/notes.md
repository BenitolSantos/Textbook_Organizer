##### _Hey there, here is an example notes.md set up_ 😊

# App Summary
My app idea is _`Textbook Library`_. It will be a library that stores users and textbooks and the current_pages the users are on. 

# Schema
### User

attribute  | attribute type
---------- | :-------------:
first_name | string
last_name  | string
user_name  | string
age        | integer
email      | string
<br>

### Subject

attribute   | attribute type
---------   | :-------------:
name        | string
credits     | string
user_id     | integer
page_id 	  | integer
<br>


### Textbook

attribute   | attribute type
---------   | :-------------:
title       | string
description | string
body        | string
pages       | integer
user_id     | integer
page_id 	  | integer
<br>

### Current_page
attribute   | attribute type
---------   | :-------------:
page_number | integer
chapter_num | integer



------------------------------------------------

### Models
#### User
has_many :textbooks
has_many :subjects, through: :textbooks
has_many :current_pages
has_many :textbooks, through: :current_pages 

validates :name, presence: true

<br>

#### Textbook
belongs_to :subject
has_many :current_pages
has_many :users, through: :current_pages

validates :title, presence: true

<br>

#### Subject

has_many :textbooks
has_many :users, through: :textbooks

validates :name, presence: true

<br>



#### Current_page (used to monitor progress throughout book)
 
belongs_to :textbook
belongs_to :user

validates :page_number, presence: true

------------------------------------------------
##### Below are the detailed specifications for the Rails Assessment. Try to answer them as best you can. Again, no worries if you arent sure on a particular item - We can talk about it together!

#### Specs:
- [x] Using Ruby on Rails for the project
  <br>

- [X] Include at least one has_many relationship
  * Example of one has_many relationship (e.g. x has_many y; User has_many books)
  <br>

- [X] Include at least one belongs_to relationship
  * Example of one belongs_to relationship (e.g. y belongs_to x; e.g. textbook belongs_to User)
  <br>

- [X] Include at least two has_many through relationships
  * Example of one belongs_to relationship (e.g. x has_many z through y; e.g. User has_many current_pages through textbook)
  <br>

- [X] Include at least one many-to-many relationship
  * Example of many to many relationship (e.g. x has_many y through z, y has_many x through z; (e.g. User has_many Categories through Posts, Categories has_many Users through Posts)
  <br>

- [X] The "through" part of the has_many through includes at least one user submittable
  * attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (think attribute_name e.g. post.title)
  <br>

- [X] Include reasonable validations for simple model objects
  * list of model objects with validations e.g. User, Post, Category (see above)
  <br>

- [X] Include a class level ActiveRecord scope method (see user ticket method in rails amusement park)
  * model object & class method name and URL to see the working feature e.g. Category.most_posts URL: /categories/most_posts)
  <br>

activerecord scope methods

find create_with distinct eager_load extending from group having includes joins left_outer_joins limit lock none offset order preload readonly references reorder reverse_order select where
https://guides.rubyonrails.org/active_record_querying.html

https://www.theodinproject.com/courses/ruby-on-rails/lessons/active-record-associations

- [X] Include signup (Remember bcrypt salt)
  <br>

- [X] Include login
  <br>

- [X] Include logout
  <br>

- [X] Include third party signup/login
  <br>

- [X] Include nested resource show or index (routes.erb 
  * URL e.g. categories/3/posts -> class/3/books/
  <br>

- [] Include nested resource "new" form ()
  * URL e.g. categories/7/posts/new)
  <br>

resources :attractions do 
  resources :rides
end

/attractions/1/rides/new <- just rides/new associated


- [X] Include form display of validation errors
  * form URL e.g. /posts/new)
  <br>

Confirm:
- [X] The application is pretty DRY (partials and layouts most def)
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate (scope method is a helper method)
- [X] Views use partials if appropriate

Optional:
Look into bootstrap and possibly add a little CSS

1. https://guides.rubyonrails.org/association_basics.html#polymorphic-associations  2. https://launchschool.com/blog/understanding-polymorphic-associations-in-rails 
From Meg Gutshall to Everyone: (07:22 PM)
 3. https://www.theodinproject.com/courses/ruby-on-rails/lessons/active-record-associations#polymorphic-associations 
From Dwayne Harmon to Everyone: (07:37 PM)
 https://en.wikipedia.org/wiki/Artists_and_repertoire 
From Dwayne Harmon to Everyone: (07:37 PM)
 1. https://api.rubyonrails.org/v5.2.3/classes/ActiveRecord/Enum.html  2. https://sipsandbits.com/2018/04/30/using-database-native-enums-with-rails/  3. https://www.justinweiss.com/articles/creating-easy-readable-attributes-with-activerecord-enums/ 

https://www.tutorialspoint.com/python/python_tuples.htm 1. https://www.justinweiss.com/articles/should-you-use-scopes-or-class-methods/  2. https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html  3. https://guides.rubyonrails.org/active_record_querying.html 
From Dwayne Harmon to Everyone: (08:08 PM)
 https://www.theodinproject.com/courses/ruby-on-rails/lessons/active-record-associations https://www.digitalocean.com/community/tutorials/how-to-add-bootstrap-to-a-ruby-on-rails-application