ActionController::Routing::Routes.draw do |map|
  map.resources :macro_tweets
  map.root :controller => 'macro_tweets'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
