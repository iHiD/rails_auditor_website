RailsAuditorWebsite::Application.routes.draw do
  
  namespace :project do resources :audits end

  resources :projects

  devise_for :users

  # root :to => 'welcome#index'
  
end
