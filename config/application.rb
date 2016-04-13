require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module RedmineApp
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.encoding = 'utf-8'

    #config.assets.initialize_on_precompile = false
    config.assets.initialize_on_precompile = true

    config.assets.precompile += %w( attachments.js context_menu.js jquery-1.11.1-ui-1.11.0-ujs-3.1.4.js raphael.js project_identifier.js revision_graph.js repository_navigation.js gantt.js responsive.js )
    config.assets.precompile += %w( context_menu.css context_menu_rtl.css custom_red.css responsive.css rtl.css scm.css )

    config.autoload_paths += %W(#{config.root}/lib)

    config.active_record.store_full_sti_class = true
    config.active_record.default_timezone = :local

    I18n.enforce_available_locales = true

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.enabled = false

    config.assets.version = '1.0'

    config.action_mailer.perform_deliveries = false

    config.action_controller.include_all_helpers = false

    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_after ActionDispatch::ParamsParser, ActionDispatch::XmlParamsParser

    config.middleware.use Rack::ContentLength

    config.redmine_verify_sessions = true

    config.redmine_search_cache_store = :memory_store

    config.log_level = Rails.env.production? ? :info : :debug

    config.session_store :cookie_store,
      :key => '_redmine_session',
      :path => config.relative_url_root || '/'

    if File.exists?(File.join(File.dirname(__FILE__), 'additional_environment.rb'))
      instance_eval File.read(File.join(File.dirname(__FILE__), 'additional_environment.rb'))
    end
  end
end
