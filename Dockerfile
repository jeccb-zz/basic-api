FROM ruby:2.3-stretch

RUN mkdir /basic-api

WORKDIR /basic-api

COPY Gemfile /basic-api/Gemfile
COPY Gemfile.lock /basic-api/Gemfile.lock

RUN bundle install

COPY . /basic-api

EXPOSE 3000

CMD rails server
