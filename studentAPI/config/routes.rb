Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  namespace "api" do
    resources :students, only: [:index]
  end
end
