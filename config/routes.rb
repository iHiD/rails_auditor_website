RailsAuditorWebsite::Application.routes.draw do
  
  resources :projects
  resources :audits, only: [:show] do
    member do
      get :gems
    end
  end

  devise_for :users

  # root :to => 'welcome#index'
  
end
