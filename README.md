## The Information Code Challenge

Email is a critical communications channel for The Information. The mission for this code challenge is to build a Rails app that permits users to make changes to what types of messages they receive.

## How to run this app

You can run this application by follow this set of instructions:

1. `git clone git@github.com:erintherad/theInformation_code_challenge.git` and `cd` into directory.
2. `bundle install` all dependencies.
3. `rake db:setup` to seed and setup database.
4. Start a server `rails s`
5. Go to the [browser](http://localhost:3000/).

This will bring you to an admin view of all users.  As admin, you can show, delete or add a new user. Each user will have an associated token.  Should any token be missing, admins can generate a new one.

## Technologies

This app was built with Ruby on Rails and utilizes a SQLite database.

This Ruby on Rails app includes the following features:

### 1. A _User_ model.

_User_ should contain a name, email address, and booleans controlling whether a user should receive messages from three different email channels:
  - marketing,
  - articles,
  - digest.

No two accounts should be able to share the same email address.

### 2. A _Token_ model.

_Token_ should contain a string property called "nonce" and a reference to the User model.
_Token_ should implement the following methods:
- a static method, _generate_, which takes a User object and returns a new Token referring to that user as well as a long, secure random string in the "nonce" property.
- a static method, _consume_, which looks for a Token by its nonce. If it finds the token, it should delete it and return the associated User object. Otherwise it should return nil.

### 3. A view to change email settings.
Build a full route, including controller and view, from which a user can change their email address and toggle each of the email channels listed above on or off. There should be both individual controls and a single toggle marked "do not email" that turns them all off.

The view should have two query parameters, _email_ and _token_. If _email_ does not correspond to the email address of an existing user object, or "token" does not contain the nonce of a token that points to the same account, no changes should be accepted.

If the user tries to choose an email address which is already assigned to another user in the system, it should display an error.

### 4. Seeded data.

I used the faker gem to create randomized user data.
