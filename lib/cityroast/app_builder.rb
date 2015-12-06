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

    def generate_devise
      generate 'devise:install'
      generate 'devise administrator'
    end

    def setup_meta_tags
      template 'initializers/meta_tags.rb', 'config/initializers/meta_tags.rb', force: true
    end

    def replace_email_sender_for_devise
      gsub_file 'config/initializers/devise.rb', %r{config.mailer_sender = ".+"}, "config.mailer_sender = ENV[:email_sender]"
    end

    def add_name_to_administrators
      devise_migration = Dir.glob('db/migrate/*_devise_create_administrators.rb').first
      insert_into_file "#{devise_migration}", after: "## Database authenticatable\n" do <<-RUBY
      t.string :name,              null: false, default: ""
      RUBY
      end
    end

    def generate_simple_form
      generate 'simple_form:install --bootstrap'
    end

    def create_initializers
      # add high_voltage initializer
      template 'initializers/high_voltage.rb', 'config/initializers/high_voltage.rb', force: true
    end

    def remove_routes_comment_lines
      gsub_file 'config/routes.rb', %r{application.routes.draw do.*end}m , "application.routes.draw do\nend"
    end

    def cp_database_config_template
      template 'config/database.yml.erb', 'config/database.yml', force: true
    end

    def cp_setting_yml
      template 'config/cityroast_application.yml.erb', 'config/application.yml', force: true
    end

    def create_database
      rake('db:create')
    end

    def gitignore_files
      template 'cityroast_gitignore', '.gitignore', force: true
    end

    def rbenv_files
      template 'cityroast_ruby-version', '.ruby-version', force: true
    end

  end

end
