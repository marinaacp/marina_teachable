Rails.application.routes.draw do
  root to: "reports#index"
  get "/curso/:id", as: "report", to: "reports#show"
end
