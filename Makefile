.PHONY: setup init_db

setup:
		brew install mysql
		gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
		\curl -sSL https://get.rvm.io | bash -s stable --ruby
		gem install bundler
		docker-compose build
		cp .env.example .env

init_db:
		docker-compose up -d
		bin/rails db:reset
		bin/rails db:environment:set RAILS_ENV=test
		bin/rails db:reset RAILS_ENV=test

feature_specs:
		rspec spec/features --options .features

specs:
		rspec spec/
