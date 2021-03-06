require 'sinatra/base'
require_relative './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base 

  get '/' do 
    erb :login
  end 

  post '/authenticate' do
    redirect('/home')
  end 

  get '/signup' do 
    erb :signup
  end

  get '/home' do 
    erb :index
  end 

  post '/check_info' do 
    redirect('/home')
  end 

  post '/home' do 
    @peep = Peep.add(params[:peep])
    redirect('/home')
  end 

  get '/all_peeps' do
    @peeps = Peep.all 
    erb :all_peeps
  end 

  post '/all_peeps' do 
    redirect('/all_peeps')
  end 

  run! if app_file == $0 
end 