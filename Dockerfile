FROM public.ecr.aws/docker/library/ruby:3.1.2

RUN useradd -m rails && \
    mkdir /app && \
    chown -R rails:rails /app

WORKDIR /app

EXPOSE 3000

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . /app

RUN rm -rf tmp log && \
    mkdir -p tmp/pids tmp/ftp log && \
    chown rails:rails -R tmp log

COPY entry_point.sh /usr/bin/
RUN chmod +x /usr/bin/entry_point.sh
ENTRYPOINT ["entry_point.sh"]

CMD ["bundle", "exec", "puma"]