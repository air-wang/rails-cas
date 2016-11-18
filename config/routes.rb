Rails.application.routes.draw do
  mount PgHero::Engine, at: "pghero"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
