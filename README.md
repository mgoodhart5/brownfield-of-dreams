# Brownfield Of Dreams
Deployed at: https://fast-bayou-82329.herokuapp.com/

Functionality built on an existing base repo at Turing for Backend Module 3.

Project Spec and Evaluation Rubric: https://github.com/turingschool-examples/brownfield-of-dreams

### About the Project
![invite](/.readme/invite.jpg)

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags. A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

The project requirements are located here: https://github.com/turingschool-examples/brownfield-of-dreams/projects/1 and include the following:
* Use the Github API
* Implement Github OAuth
* Implement Self-referential relationships
* Implement Email (activation and invitation)

![invite](/.readme/githubemailservice.jpg)
![invite](/.readme/dashboardoauth.jpg)


## Local Setup

First you'll need to setup an API key with YouTube and have it defined within `ENV['YOUTUBE_API_KEY']`. There will be one failing spec if you don't have this set up. as well as an API key with both Github and Mailgun. 

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```
### Schema:
![Alt text](./public/schema_diagram.png?raw=true "Database Schema")

### Examples

![invite](/.readme/inviteclass.jpg)

![invite](/.readme/invitepage.jpg)

![invite](/.readme/usermailer.jpg)

![invite](/.readme/activation.jpg)

## Technologies
* Rails
* ActionMailer
* Mailgun
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
