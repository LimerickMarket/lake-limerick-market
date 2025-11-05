
Rails.application.routes.draw do
  devise_for :admins
  
  # Admin login alias
  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new', as: :admin_login
  end
  
  # Public routes
  root "home#index"
  
  resources :menu_items, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :promos, only: [:index, :show]
  resources :subscriptions, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  
  # Convenience route
  get '/contact', to: 'contacts#new', as: :contact
  
  # Admin routes
  namespace :admin do
    resources :menu_items
    resources :events
    resources :promos
    resources :subscribers, only: [:index, :show, :edit, :update, :destroy]
    resources :newsletter_templates do
      member do
        get :preview
        post :send_now
      end
    end
  end
  
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
