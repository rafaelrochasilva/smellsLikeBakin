# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require ::File.expand_path('../../config/environment',  __FILE__)

configure do
  set :environment, :test
  set :views, File.join(File.expand_path('../../', __FILE__), "app", "views")
end

include Sprockets::Helpers

Capybara.app = Sinatra::Application

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    js_errors: false,
    debug: true,
    phatomjs_options: ['--load-images=no',
                       '--ignore-ssl-errors=yes',
                       '--ssl-protocol=any',
                       '--proxy-type=socks5',
                       '--proxy=0.0.0.0:0',
                       '--debug=true']
  )
end
