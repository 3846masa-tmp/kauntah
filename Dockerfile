FROM ruby:2.1

WORKDIR /usr/src/app

RUN apt update && \
    apt install -y build-essential libpq-dev nodejs \
                   imagemagick libmagickcore-dev libmagickwand-dev \
                   sqlite3 libsqlite3-dev && \
    ln -s \
    /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config \
    /usr/bin/Magick-config

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --deployment
ADD . /usr/src/app/

RUN bundle exec rake assets:precompile

VOLUME ["/usr/src/app/data"]
EXPOSE 3000
CMD ["bash", "./start.sh"]
