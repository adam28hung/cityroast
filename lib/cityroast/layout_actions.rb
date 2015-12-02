module Cityroast
  module LayoutActions

    def add_custom_gems
      additions_path = find_in_source_paths 'Gemfile_additions'
      new_gems = File.open(additions_path).read
      inject_into_file 'Gemfile', "\n#{new_gems}",
      :after => /gem 'jquery-rails'/
    end

    def setup_root_route
      # HighVoltage
      route %q(get '/*id' => 'pages#show', as: :page, format: false)
      route %q(root to: 'pages#show', id: 'home')
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
      # template 'views/layouts/home.html.erb', 'app/views/layouts/home.html.erb', force: true
      remove_file 'app/views/layouts/application.html.erb'
      directory 'views/layouts', 'app/views/layouts', force: true
    end

    def create_home
      # using HighVoltage
      directory 'views/pages', 'app/views/pages', force: true
    end

  end
end
