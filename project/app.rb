require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'
require 'sinatra/reloader'
require_relative './model.rb'

get('/') do
    slim('layout')
end

get('/setup/new') do
    slim(:'setup_new')
end

post('/setup/new/driver') do
    woods_brand = params[:woods_brand]

    if (woods_brand == "Titleist")
        redirect('/setup/driver/titleist')
    
    elsif (woods_brand == "Callaway")
            redirect('/setup/driver/callaway')

    elsif (woods_brand == "Taylormade")
            redirect('/setup/driver/taylormade')

    elsif (woods_brand == "Cobra")
            redirect('/setup/driver/cobra')
    end
   
   
    
end

get('/setup/driver/titleist') do
    slim(:'setup_driver_titleist')
    
end

get('/setup/driver/callaway') do
    slim(:'setup_driver_callaway')
    
end

get('/setup/driver/taylormade') do
    slim(:'setup_driver_taylormade')
    
end

get('/setup/driver/cobra') do
    slim(:'setup_driver_cobra')
    
end

post('/choosen/driver') do
    redirect('/setup/new/irons')
end

get('/setup/new/irons') do
    slim(:'setup_irons')
end

post('/setup/brand/irons') do
    irons_brand = params[:irons_brand]

    if (irons_brand == "Titleist")
        redirect('/setup/irons/titleist')
    
    elsif (irons_brand == "Callaway")
            redirect('/setup/irons/callaway')

    elsif (irons_brand == "Taylormade")
            redirect('/setup/irons/taylormade')

    elsif (irons_brand == "Cobra")
            redirect('/setup/irons/cobra')
    end
end

get('/setup/irons/titleist') do
    slim(:'setup_irons_titleist')
    
end

get('/setup/irons/callaway') do
    slim(:'setup_irons_callaway')
    
end

get('/setup/irons/taylormade') do
    slim(:'setup_irons_taylormade')
    
end

get('/setup/irons/cobra') do
    slim(:'setup_irons_cobra')
    
end

post('/choosen/irons') do
    redirect('/setup/new/wedges')
end

get('/setup/new/wedges') do
    slim(:'setup_wedges')
end

post('/setup/brand/wedges') do
    wedges_brand = params[:wedges_brand]

    if (wedges_brand == "Titleist")
        redirect('/setup/wedges/titleist')
    
    elsif (wedges_brand == "Callaway")
            redirect('/setup/wedges/callaway')

    elsif (wedges_brand == "Taylormade")
            redirect('/setup/wedges/taylormade')

    elsif (wedges_brand == "Cobra")
            redirect('/setup/wedges/cobra')
    end
end

get('/setup/wedges/titleist') do
    slim(:'setup_wedges_titleist')
    
end

get('/setup/wedges/callaway') do
    slim(:'setup_wedges_callaway')
    
end

get('/setup/wedges/taylormade') do
    slim(:'setup_wedges_taylormade')
    
end

get('/setup/wedges/cobra') do
    slim(:'setup_wedges_cobra')
    
end

post('/choosen/wedges') do
    redirect('/setup/new/putter')
end

get('/setup/new/putter') do
    slim(:'setup_putter')
end

post('/setup/brand/putter') do
    putter_brand = params[:putter_brand]

    if (putter_brand == "Titleist")
        redirect('/setup/putter/titleist')
    
    elsif (putter_brand == "Callaway")
            redirect('/setup/putter/callaway')

    elsif (putter_brand == "Taylormade")
            redirect('/setup/putter/taylormade')

    elsif (putter_brand == "Cobra")
            redirect('/setup/putter/cobra')
    end
end

get('/setup/putter/titleist') do
    slim(:'setup_putter_titleist')
    
end

get('/setup/putter/callaway') do
    slim(:'setup_putter_callaway')
    
end

get('/setup/putter/taylormade') do
    slim(:'setup_putter_taylormade')
    
end

get('/setup/putter/cobra') do
    slim(:'setup_putter_cobra')
    
end

# post('/choosen/wedges') do
#     redirect('/setup/new/putter')
# end





