# Load Sinatra Application
require ::File.expand_path('../config/environment',  __FILE__)

app = Sinatra::Application

configure do
  # use Rack::Protection

  enable :sessions
  set :app_file, __FILE__
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'
  set :views, File.join(app.root, 'app', 'views')
end

map '/assets' do
  run AssetPipeline.precompile(app)
end

# Initialize Sinatra Application
run app
