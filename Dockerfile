FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential git nginx
RUN gem install --no-ri --no-rdoc bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN cd /app; bundle install
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/var/cache/nginx"]
ADD . /app
EXPOSE 80 443
WORKDIR /app
RUN bundle exec middleman build
ADD ./build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
