FROM ruby:2.3

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN gem install bundler && \
    cd /app ; bundle install --binstubs

COPY . /app

WORKDIR /app

CMD puma -C config/puma.rb
