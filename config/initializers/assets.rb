# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Don't process .css files with SassC - allows modern CSS syntax to pass through
# This prevents SassC from trying to parse modern CSS features (like CSS Color Level 4)
# that it doesn't understand, which would cause build failures
Rails.application.config.assets.configure do |env|
  env.unregister_preprocessor('text/css', Sprockets::SassCompressor)
end
