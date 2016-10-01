.PHONY: setup install_bundler

UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
BUNDLE_INSTALL_CMD = gem install bundler -n /usr/local/bin
else
BUNDLE_INSTALL_CMD = gem install bundler
endif

setup: | install_bundler
		brew install mysql
		gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
		\curl -sSL https://get.rvm.io | bash -s stable --ruby
		bundle install
		docker-compose build

install_bundler:
		$(BUNDLE_INSTALL_CMD)
