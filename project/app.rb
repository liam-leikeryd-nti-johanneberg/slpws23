require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'
require 'sinatra/reloader'

get('/') do
    slim('layout')
end

get('/setup/new') do
    slim(:'setup_new')
end