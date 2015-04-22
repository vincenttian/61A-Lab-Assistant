Rails.application.routes.draw do
  
  devise_scope :admin do
    root to: "home#index"
  end
  devise_for :admins
  devise_for :teaching_assistants
  devise_for :lab_assistants

  namespace :admins, as: :admin do
    resource :dashboard, only: :show, controller: "dashboard"
  end

  namespace :teaching_assistants, as: :teaching_assistants do
    resource :dashboard, only: :show, controller: "dashboard"
  end

  namespace :lab_assistants, as: :lab_assistants do
    resource :dashboard, only: :show, controller: "dashboard"
  end

  scope module: :admins do
    resources :admins, only: [:edit, :update] do
	  # 
    end
  end

  resources :lab_assistants
  resources :teaching_assistants
  resources :check_in_forms
  resources :lab_times

  match 'lab_assistants/preferences', to:'lab_assistants/dashboard#preferences', via: :post
  match 'lab_times/ta', to:'lab_times#ta', via: :post
  match 'admins/dashboard', to:'admins/dashboard#show', via: [:get, :post]
  match 'admins/match', to:'admins/dashboard#match', via: :get
  match 'teaching_assistants/dashboard', to:'teaching_assistants/dashboard#show', via: [:get, :post]
  match 'lab_assistants/contract/sign_up', to: 'lab_assistants#new_contract', via: :get
  match 'lab_assistants/contract/sign_up', to: 'lab_assistants#create_contract', via: :post

end
