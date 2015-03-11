Rails.application.routes.draw do
  devise_for :users

  devise_scope :admin do
    root to: "devise/sessions#new"
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

end
