FROM ruby:2.7.4-alpine

ENV APP_PATH /myapp
ENV RAILS_PORT 3000



# install dependencies for application these are specific to alpine
RUN apk -U add --no-cache \
build-base \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH 

RUN gem install rails -v '6.1.4'

# navigate to app directory
WORKDIR $APP_PATH

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE $RAILS_PORT

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]