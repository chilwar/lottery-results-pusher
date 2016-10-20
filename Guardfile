# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features)

## Uncomment to clear the screen before every task
# clearing :on

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

guard :rspec, cmd: "bundle exec rspec" do
  require "ostruct"

  # Generic Ruby apps
  rspec = OpenStruct.new
  rspec.spec = ->(m) { "spec/#{ m }_spec.rb" }
  rspec.spec_dir = "spec"
  rspec.spec_helper = "spec/spec_helper.rb"
  rspec.spec_support = %r{^spec/support/(.+)\.rb$}
  rspec.spec_whenever = "spec/whenever_spec.rb"

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| rspec.spec.("lib/#{ m[1] }") }
  watch(rspec.spec_helper)      { rspec.spec_dir }
  watch(rspec.spec_whenever)      { rspec.spec_whenever }
  watch('Rakefile')      { rspec.spec_whenever }

  # file needing a full reload of the page anyway
  watch(%r{lib/(.+)/(.+)\.rb}) { |m| "spec/lib/#{ m[1] }/#{ m[2] }_spec.rb" }
  watch(%r{lib/(.+)/(.+)/(.+)\.rb}) { |m| "spec/lib/#{ m[1] }/#{ m[2] }/#{ m[3] }_spec.rb" }
end
