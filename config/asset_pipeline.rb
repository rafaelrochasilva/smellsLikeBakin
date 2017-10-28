class AssetPipeline
  def self.precompile(app)
    asset_pipe_line = Sprockets::Environment.new(app.settings.root)
    asset_pipe_line.append_path('app/assets/javascripts')
    asset_pipe_line.append_path('app/assets/stylesheets')
    asset_pipe_line.append_path('app/assets/images')

    asset_pipe_line.js_compressor = :uglify
    asset_pipe_line.css_compressor = :scss

    Sprockets::Helpers.configure do |config|
      config.environment = asset_pipe_line
      config.prefix = '/assets'
      config.digest = true
    end

    app.helpers(Sprockets::Helpers)

    asset_pipe_line
  end
end
