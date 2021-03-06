Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: 'front/abouts#index'

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  namespace :admin do 
    resources :social_modules, path: "social_module", only: [:index, :edit, :update, :destroy]
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
    resources :projects do
      collection do
        get :show_images
      end
    end
    resources :project_images do
      collection do
        delete :destroy_multiple
      end
    end
    resources :bios do
      collection do
        post :bio_update
      end
    end
  end

  namespace :front, path: '' do
    resources :portfolios, only: [:index, :show], path: 'portfolio'
    resources :abouts, only: [:index], path: 'about'
    resources :posts, only: [:index, :show], path: 'blog'
    resources :messages, only: [:new, :create]
    resources :comments, only: [:create]
    resources :reviews, only: [:index, :show]
    resources :visitors, only: [:new, :create], path: 'message'
  end



  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
end
