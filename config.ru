require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # use Rack::Protection

  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

helpers do
  include Sprockets::Helpers
end

# Use Asset Pipe Line to minify css and js
map '/assets' do
  asset_pipe_line = Sprockets::Environment.new
  asset_pipe_line.append_path 'app/assets/javascripts'
  asset_pipe_line.append_path 'app/assets/stylesheets'
  asset_pipe_line.append_path 'app/assets/images'

  asset_pipe_line.js_compressor = :uglify
  asset_pipe_line.css_compressor = :scss

  Sprockets::Helpers.configure do |config|
    config.environment = asset_pipe_line
    config.prefix = '/assets'
    config.digest = true
  end

  run asset_pipe_line
end

map '/' do
  run Sinatra::Application
end
