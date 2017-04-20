FROM ruby:2.3.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Define where our application will live inside the image
ENV RAILS_ROOT /usr/src/app

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .
EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
