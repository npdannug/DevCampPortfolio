Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root 'pages#home', except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  resources :portfolios do
    member do
      patch :move 
    end
  end


  resources :blogs do
    member do
      get :toggle_status
    end
  end
end
