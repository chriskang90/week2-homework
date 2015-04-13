Rails.application.routes.draw do

  get '/greet' => 'greet#show'
  get '/contact' => 'contact#index'
  get '/contact_submitted' => 'contact#submit'
  get '/rps' => 'rps#index'
  get '/rps_play' => 'rps#play'
  get '/dice' => 'dice#index'
  get '/dice/play' => 'dice#play'

end
