Rails.application.routes.draw do

  root to: 'front/profiles#index'

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  namespace :admin do 
    resources :posts
    resources :books do
      collection do
        get :display_update
      end
    end
    resources :settings, only: [:new, :create, :edit, :update]
    resources :dashboard, only: [:index]
    resources :notifications, only: [:index, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
    resources :visitors, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
    resources :tags, except: [:index]
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
    resources :bios do
      collection do
        post :bio_update
      end
    end
  end

  namespace :front, path: '' do
    resources :profiles, only: [:index]
    resources :resumes, only: [:index]
    resources :posts, only: [:index, :show], path: 'blog'
    resources :messages, only: [:new, :create]
    resources :comments, only: [:create]
    resources :reviews, only: [:index, :show]
  end



  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
end
