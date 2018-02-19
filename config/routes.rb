Rails.application.routes.draw do
  get "/docs" => redirect("/index.html?url=/docs/api-docs.json")
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: %i[create index show]
    end
  end
end
