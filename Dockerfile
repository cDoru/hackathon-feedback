FROM ruby:2.3

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN gem install bundler && \
    cd /app ; bundle install --binstubs

COPY . /app

WORKDIR /app

CMD puma -C config/puma.rb
