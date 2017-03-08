%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  config/application.yml
  config/database.yml
  uploaders/*
).each { |path| Spring.watch(path) }
