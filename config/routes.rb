RailsAuditorWebsite::Application.routes.draw do
  
  resources :projects do 
    resources :audits
  end

  devise_for :users

  # root :to => 'welcome#index'
  
end
