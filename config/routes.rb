Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:  "articles#index"
  resources :articles do
    member do
      get :all_articles
    end
  end
  get 'signup', to: "users#new"
  resources :users ,except:[:new] do
    member do
      get :all_articles
    end
  end
  
  # get 'all_articles' , to: 'users#all_articles'
  get 'login' ,to: "sessions#new"
  post 'login' , to: "sessions#create"
  delete 'logout' , to: 'sessions#destroy'
  resources :categories ,except:[:destroy]
 end
