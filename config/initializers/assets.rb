# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"]
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
#
Rails.application.config.assets.precompile += %w( market.css market.js html5.js )

Rails.application.config.assets.precompile.concat(
    Dir.glob(Rails.root.join('app/assets/javascripts/locales/*.js.erb'))
        .map { |f| File.join('locales', File.basename(f, '.erb')) }
)

Dir.chdir 'vendor/assets/yarn_components' do
  Dir['yarn_components/**/*.{jpg,jpeg,png,gif,svg}'].each do |path|
    Rails.application.config.assets.precompile << path
  end
end