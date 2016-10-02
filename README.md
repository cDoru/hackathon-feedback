# Feedback app

Web application for gathering feedback from your colleagues.

## Getting started
First, make sure you have Docker installed. Second, run the setup from the Makefile:

`make setup`

This will install a number of development dependencies:

* MySQL
* RVM (Ruby Version Manager) incl. latest Ruby
* Bundler gem
* Docker images for MySQL and Ruby

With these dependencies installed, you will be able to develop the application locally and also via the provided Docker setup.

To create the databases, run:

`make init_db`

To get the Google authentication working, you need to setup Google OAuth credentials via the Google API Console (see https://developers.google.com/identity/protocols/OAuth2). Add a Google client ID and a Google client secret to the .env file in the root of your application.

## Running the Docker setup
You can start the application containers by running:

`docker-compose up`

Or if you want to run it as a daemon:

`docker-compose up -d`

Then visit [http://localhost:3001]() to see the application.

## Running tests
Make sure you have the test database running:

`docker-compose up -d mysql_test`

Then run specs: `make specs` for model and controller specs and `make feature_specs` for feature specs.