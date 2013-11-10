PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create, :show]
   end
  resources :categories, except: [:index, :destroy]
end
