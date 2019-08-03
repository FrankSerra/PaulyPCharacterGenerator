Rails.application.routes.draw do
  resources :resource_loadout_combos
  get 'home/index'
  resources :weapon_offense_type_combos
  resources :modifiers
  resources :shapes
  resources :elements
  resources :armor_types
  resources :weapons
  resources :offense_types
  resources :resources
  resources :stats
  resources :races
  resources :char_configs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
