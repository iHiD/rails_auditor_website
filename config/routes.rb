RailsAuditorWebsite::Application.routes.draw do
  
  resources :projects

  devise_for :users

  # root :to => 'welcome#index'
  
end
