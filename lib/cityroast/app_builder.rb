module Cityroast
  class AppBuilder < Rails::AppBuilder

    include Cityroast::Actions
    include Cityroast::LayoutActions

    # source struct:
    # Rails
    #   (module)ActionMethods
    #   (class)AppBuilder
    #   (module)Generators
    #     (class) AppGenerator < AppBase
    def remove_files_we_dont_need

    end

    def create_initializers
      # add high_voltage initializer
      template 'initializers/high_voltage.rb', 'config/initializers/high_voltage.rb',:force => true
    end

    def set_up_high_voltage
      template 'controllers/pages_controller.rb', 'app/controllers/pages_controller.rb',:force => true
    end

    def remove_routes_comment_lines
      gsub_file 'config/routes.rb', %r{application.routes.draw do.*end}m , "application.routes.draw do\nend"
    end

  end
end
