Rails.application.routes.draw do
  devise_for :users

  devise_scope :teaching_assistant do
    root to: "home#index"
  end
  devise_for :teaching_assistant
end
