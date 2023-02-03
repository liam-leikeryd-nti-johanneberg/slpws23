require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'
require 'sinatra/reloader'
require_relative './model.rb'

get('/') do
    slim('layout')
end

get('/setup_new') do
    slim(:'setup_new')
end

post('/setup/new') do
    woods_brand = params[:woods_brand]

    if (woods_brand == "Titleist")
        redirect('/setup_new/titleist')
    
    elsif (woods_brand == "Callaway")
            redirect('/setup_new/callaway')

    elsif (woods_brand == "Taylormade")
            redirect('/setup_new/taylormade')

    elsif (woods_brand == Cobra)
            redirect('/setup_new/cobra')
    end
   
   
    
end

get('setup_new/titleist') do
    slim(:'setup_new/titleist')
    
end
