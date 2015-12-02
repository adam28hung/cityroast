require 'rails/generators'
require 'rails/generators/rails/app/app_generator'


module Cityroast
  class AppGenerator < Rails::Generators::AppGenerator

    def finish_template
      invoke :cityroast_blend
      super
    end

    def cityroast_blend
      invoke :remove_files_we_dont_need
      # invoke :setup_development_environment
      invoke :create_cityroast_views
      invoke :create_common_assets

      # invoke :add_common_js_library
      # invoke :add_common_rake_tasks
      invoke :customize_gemfile
      invoke :configure_app
      invoke :create_initializers
      invoke :remove_routes_comment_lines
      invoke :set_up_high_voltage
      invoke :setup_root_route # at: Cityroast::LayoutActions
    end

    def remove_files_we_dont_need
      build :remove_files_we_dont_need
    end

    def customize_gemfile
      build :add_custom_gems #at: Cityroast::LayoutActions
    end

    def configure_app
      say 'Configuring app'
    end

    def remove_routes_comment_lines
      build :remove_routes_comment_lines
    end

    def create_initializers
      say 'create_initializers'
      build :create_initializers #at: Cityroast::AppBuilder
    end

    def set_up_high_voltage
      build :set_up_high_voltage
      build :create_home
    end

    def setup_root_route
      build :setup_root_route
    end

    def create_cityroast_views
      say 'Creating cityroast views' #, "\e[45m"
      build :create_common_partial
      build :create_cityroast_layout_files
    end
    
    def create_common_assets
      build :create_common_js_assets
      build :create_common_css_assets
    end

    protected

    def get_builder_class
      Cityroast::AppBuilder
    end

  end
end
