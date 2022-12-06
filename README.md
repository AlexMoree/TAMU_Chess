
# README

## Introduction ##

This is an application for Texas A&M University Chess Club. This application provides sign up features for new students, attendance check in, and statistics of students' chess.com or lichess.org blitz and rapid record.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/AlexMoree/TAMU_Chess.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd your_github_here`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

2 ENV variables 'GOOGLE_OAUTH_CLIENT_ID', and 'GOOGLE_OAUTH_CLIENT_SECRET', are used for the Google oatuh2 login. If a new credentials is created, you will need to update these values according to the new values generated.
These values are located in both config/environments/development.rb and config/environments/production.rb on line 6.

The values are currently:

ENV['GOOGLE_OAUTH_CLIENT_ID'] = '930403782664-cljh5k296dgnqqraucc932b5208bffko.apps.googleusercontent.com'

ENV['GOOGLE_OAUTH_CLIENT_SECRET'] = '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'

## CI/CD ##

Continuous integration is implemented using Github Actions. Whenever code is pushed to a branch, you can check the Actions tab in Github to view the results of the rspec, brakeman, and rubocop tests. Continous deployment is implemented using a Heroku pipeline. Whenever the main branch of this Github repository is updated, if it passes all of the automated testing, it'll automatically deploy the new version of the app in Heroku at https://tamu-chess-app.herokuapp.com/

## Support ##

email: alex_moree@tamu.edu
