# Rails FlashCardR Tool

[![Build Status](https://travis-ci.org/webdev1001/flashcardr.svg?branch=master)](https://travis-ci.org/webdev1001/flashcardr)

* https://github.com/webdev1001/flashcardr

## DESCRIPTION:

Rails FlashCardR Tool is a monolithic web application that I've created to learn the Rails architecture with the help of a mentor.

Manager of flash cards is like a piece of paper - on one side word in one language and on the backside - the translation. Popular for learning new languages. Use this cards for iterative (repetitive) learning. Effectivness of that method is proved and widely used.

## FEATURES:

- Simple CRUD in Rails (create, delete, edit and view cards)
- Business Logic ()
- Writing Tests
- Authorization, authentication with Sorcery
- Background tasks
- API
- Deploy on VPS
- other misc. features

## REQUIREMENTS:

- Ruby, Rake, Bundler, Rails 4
- PostgreSQL

## GETTING STARTED:

You will need to install and init PostgreSQL locally.

To get started quickly, you can just run it locally. Setting that up goes something like this:

* Open a terminal and navigate to the root directory of the application
* Run ```bundle install``` to install dependencies.
* Run ```rake db:migrate``` to create a local database.
* Run ```rake db:seed``` to install demo data.
* Run ```rails server``` to start a local web server.
* Open a browser and navigate to http://localhost:3000
