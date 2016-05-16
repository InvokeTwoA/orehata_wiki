source 'https://rubygems.org'

ruby '2.2.1'

if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('1.5.0')
  abort "Redmine requires Bundler 1.5.0 or higher (you're using #{Bundler::VERSION}).\nPlease update with 'gem update bundler'."
end

#gem 'sass-rails', '~> 5.0'
#gem "rails", "4.2.5.2"
gem "rails", "4.1.5"
gem "jquery-rails", "~> 3.1.4"
gem 'jquery-ui-rails'
gem "coderay", "~> 1.1.0"
gem "builder", ">= 3.0.4"
gem "request_store", "1.0.5"
gem "mime-types"
gem "protected_attributes"
gem "actionpack-action_caching"
gem "actionpack-xml_parser"
gem "roadie-rails"
gem 'simple_form', '~> 3.0.2'
gem 'jpmobile'
gem 'kaminari'
gem 'css2sass'
gem 'ransack'  # search_form
gem "font-awesome-rails"  # fa-icon

#gem 'twitter-bootswatch-rails', '3.2.0'
#gem 'therubyracer'

#gem 'bootstrap-sass'

#gem 'twitter-bootstrap-rails'
#gem 'twitter-bootswatch-rails', '3.2.0'
#gem 'twitter-bootswatch-rails-helpers'
#gem 'execjs'
#gem 'less-rails'
#gem 'libv8', '3.16.14.13'

gem 'haml'
gem 'meta-tags', :require => 'meta_tags'

gem 'inherited_resources', "~> 1.5.0"

# Request at least nokogiri 1.6.7.2 because of security advisories
gem "nokogiri", ">= 1.6.7.2"

# Request at least rails-html-sanitizer 1.0.3 because of security advisories 
gem "rails-html-sanitizer", ">= 1.0.3"


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :x64_mingw, :mswin, :jruby]
gem "rbpdf", "~> 1.19.0"

# Optional gem for LDAP authentication
group :ldap do
  gem "net-ldap", "~> 0.12.0"
end

# Optional gem for OpenID authentication
group :openid do
  gem "ruby-openid", "~> 2.3.0", :require => "openid"
  gem "rack-openid"
end

platforms :mri, :mingw, :x64_mingw do
  # Optional gem for exporting the gantt to a PNG file, not supported with jruby
  group :rmagick do
    gem "rmagick", ">= 2.14.0"
  end

  # Optional Markdown support, not for JRuby
  group :markdown do
    gem "redcarpet", "~> 3.3.2"
  end
end

platforms :jruby do
  # jruby-openssl is bundled with JRuby 1.7.0
  gem "jruby-openssl" if Object.const_defined?(:JRUBY_VERSION) && JRUBY_VERSION < '1.7.0'
  gem "activerecord-jdbc-adapter", "~> 1.3.2"
end

# Include database gems for the adapters found in the database
group :production do
  gem "pg", ">= 0.11.0", :platforms => [:mri, :mingw, :x64_mingw]
  gem 'rails_12factor'
  gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby


  # 高速化
  gem 'heroku-deflater'
end

group :development do
  gem "rdoc", ">= 2.4.2"
  gem "yard"
  gem 'mysql2'
end

group :test do
  gem "minitest"
  gem "rails-dom-testing"
  gem "mocha"
  gem "simplecov", "~> 0.9.1", :require => false
  # For running UI tests
  gem "capybara"
  gem "selenium-webdriver"
end

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  eval_gemfile local_gemfile
end

# Load plugins' Gemfiles
Dir.glob File.expand_path("../plugins/*/{Gemfile,PluginGemfile}", __FILE__) do |file|
  eval_gemfile file
end
