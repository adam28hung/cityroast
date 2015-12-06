require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Cityroast
  class AppGenerator < Rails::Generators::AppGenerator

    def finish_template
      say 'get in finish_template'
      invoke :cityroast_blend
      super
    end

    def run_after_bundle_callbacks
      super
      invoke :after_roasting
    end

    def cityroast_blend
      say 'get in cityroast_blend'
      invoke :remove_files_we_dont_need
      invoke :remove_routes_comment_lines
      invoke :setup_gitignore
      invoke :setup_rbenv
      invoke :create_cityroast_views
      invoke :create_common_assets
      invoke :customize_gemfile
    end

    def after_roasting
      say 'get in after_roasting'
      invoke :configure_app
      invoke :create_initializers

      invoke :setup_database
    end

    # after_roasting
    # =======================================
    def configure_app
      say 'Configuring app'
      build :cp_setting_yml
      build :generate_simple_form
      build :setup_high_voltage
      build :setup_devise
      build :setup_meta_tags
    end

    def setup_high_voltage
      say 'setup high_voltage'
      build :create_pages_files
    end

    def setup_devise
      say 'setup devise'
      build :generate_devise
      build :replace_email_sender_for_devise
      build :add_name_to_administrators
    end

    def create_initializers
      say 'create initializers'
      build :create_initializers
    end

    def setup_database
      say 'setup database'
      build :cp_database_config_template
      build :create_database
    end

    # =======================================

    # cityroast_blend
    # =======================================

    def remove_files_we_dont_need
      build :remove_public_index
      build :remove_rails_logo_image
    end

    def remove_files_we_dont_need
      say 'get in remove_files_we_dont_need'
      build :remove_files_we_dont_need
    end

    def remove_routes_comment_lines
      say 'remove routes_comment_lines'
      build :remove_routes_comment_lines
    end

    def setup_gitignore
      say 'get in setup_gitignore'
      build :gitignore_files
    end

    def setup_rbenv
      say 'get in setup_rbenv'
      build :rbenv_files
    end

    def create_cityroast_views
      say 'Creating cityroast views' #, "\e[45m"
      build :create_common_partial
      build :create_cityroast_layout_files
      build :create_baisc_admin
    end

    def create_common_assets
      say 'get in common_assets'
      build :create_common_js_assets
      build :create_common_css_assets
    end

    def customize_gemfile
      say 'get in customize_gemfile'
      build :add_custom_gems
    end
    # =======================================

    # others =======================================
    def set_up_routes
      build :setup_root_route
    end

    def rake_up
      rake 'db:migrate'
    end

    protected

    def get_builder_class
      Cityroast::AppBuilder
    end

  end

end
