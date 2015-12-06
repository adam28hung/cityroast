Rails.application.routes.draw do

  devise_for :administrators

  authenticated :administrator do
    # Admin
    namespace :administration do
      root to: "administrators#index", :as => :authenticated_administrator

      resources :administrators
    end

  end


  # ref: https://www.youtube.com/watch?v=3MiN8otMliQ
  # collect
  # match '/404' => 'errors#not_found', via: :all
  # match '/406' => 'errors#not_acceptable', via: :all
  # match '/500' => 'errors#internal_server_error', via: :all
  get '/*id' => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'

end
