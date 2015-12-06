module Cityroast
  module LayoutActions

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo_image
      remove_file 'app/assets/images/rails.png'
    end

    def add_custom_gems
      additions_path = find_in_source_paths 'Gemfile_additions'
      new_gems = File.open(additions_path).read
      inject_into_file 'Gemfile', "\n#{new_gems}",
      :after => /gem 'jquery-rails'/
    end

    def setup_root_route
      path = File.expand_path(File.join("../../", "templates"), File.dirname(__FILE__))
      file = File.join(path, 'config', 'routes.rb')
      contents = IO.read(file)

      gsub_file 'config/routes.rb', %r{Rails.application.routes.draw do.*end}m, contents
    end

    def create_common_js_assets
      remove_file 'app/assets/javascripts/application.js'
      directory 'assets/javascripts', 'app/assets/javascripts', force: true
    end

    def create_common_css_assets
      remove_file 'app/assets/stylesheets/application.css'
      directory 'assets/stylesheets', 'app/assets/stylesheets', force: true
    end

    def create_common_partial
      directory 'views/common', 'app/views/common'
    end

    def create_cityroast_layout_files
      remove_file 'app/views/layouts/application.html.erb'
      directory 'views/layouts', 'app/views/layouts', force: true
    end

    def create_baisc_admin
      directory 'views/admin', 'app/views/administration', force: true
      directory 'controllers/admin/admins.rb', 'app/controllers/administration/administrators', force: true
    end

    def create_pages_files
      directory 'views/pages', 'app/views/pages', force: true
      template 'controllers/application_controller.rb', 'app/controllers/application_controller.rb',:force => true
      template 'controllers/pages_controller.rb', 'app/controllers/pages_controller.rb',:force => true
    end

  end
end
