Rails.application.routes.draw do
  devise_for :users

  devise_scope :admin do
    root to: "home#index"
  end
  devise_for :admins

  namespace :admins, as: :admin do
    resource :dashboard, only: :show, controller: "dashboard"
  end

  scope module: :admins do
    resources :admins, only: [:edit, :update] do
	  # 
    end
  end

  resources :lab_assistants, only: [:new, :create, :index, :destroy]
  resources :teaching_assistants, only: [:new, :create, :index, :destroy]

end
