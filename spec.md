# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      Files and folders generated via corneal gem
- [x] Use ActiveRecord for storing information in a database
      Models inherit from ActiveRecord::Base
- [x] Include more than one model class (e.g. User, Post, Category)
      Critical models include deck, player, playerdeck (join-table), and profession
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
      deck and player are in a many-to-many relationship through playerdeck
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      deck belongs to a profession
- [x] Include user accounts with unique login attribute (username or email)
      login/logout methods are in application controller
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      CRUD included for both deck and player. Profession is static due to design of the game.
- [x] Ensure that users can't modify content created by other users
      Logged_in is checked at vital CRUD methods
- [x] Include user input validations
      Validations included for Player and Deck model
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
      Flash messages included
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      See README.md

Confirm
- [x] You have a large number of small Git commits
      Around ~50 commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
