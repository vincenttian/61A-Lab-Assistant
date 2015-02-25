Rails.application.routes.draw do
  devise_for :users

  devise_scope :teaching_assistant do
    root to: "devise/sessions#new"
  end
  devise_for :teaching_assistant
end
