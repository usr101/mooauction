FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /mooauction
WORKDIR /mooauction
COPY ./Gemfile /mooauction/Gemfile
COPY ./Gemfile.lock /mooauction/Gemfile.lock
RUN bundle install
COPY . /mooauction