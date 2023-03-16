require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'
require 'sinatra/reloader'
require_relative './model.rb'

enable :sessions



get('/') do
    slim('layout')
end

get('/showlogin') do
    slim(:login)
end

get('/users/new') do
    slim(:register)
end





post('/login') do
    username = params[:username]
    password = params[:password]
    db = SQLite3::Database.new('db/setup_creator.db')
    db.results_as_hash = true
    result = db.execute("SELECT * FROM users WHERE username = ?",username).first  
    pwdigest = result["pwdigest"]
    id = result["id"]
  
    if BCrypt::Password.new(pwdigest) == password 
      session[:id] = id
      redirect('/setup/new')
    else 
      "FEL LÖSEN!" 
    end
  end

post('/users/new') do
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
  
    if (password == password_confirm)
      password_digest = BCrypt::Password.create(password)
      db = SQLite3::Database.new('db/setup_creator.db')
      db.execute("INSERT INTO users (username,pwdigest) VALUES (?,?)",username,password_digest)
      redirect('/')
    else
      "Lösenorden matchade inte!"
    end
  end

get('/setup/new') do
    slim(:'setup/setup_new')
end

post('/setup/new/driver') do
    woods_brand = params[:woods_brand]
    session[:setup] = {woods_brand: woods_brand}

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
    slim(:'setup/setup_driver_titleist')
    
end

get('/setup/driver/callaway') do
    slim(:'setup/setup_driver_callaway')
    
end

get('/setup/driver/taylormade') do
    slim(:'setup/setup_driver_taylormade')
    
end

get('/setup/driver/cobra') do
    slim(:'setup/setup_driver_cobra')
    
end

post('/choosen/driver') do
    woods_model = params[:woods_model]
    session[:setup][:woods_model] = woods_model
    redirect('/setup/new/irons')
end

get('/setup/new/irons') do
    slim(:'setup/setup_irons')
end

post('/setup/brand/irons') do
    irons_brand = params[:irons_brand]
    session[:setup][:irons_brand] = irons_brand

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
    
    slim(:'setup/setup_irons_titleist')
    
end

get('/setup/irons/callaway') do
    slim(:'setup/setup_irons_callaway')
    
end

get('/setup/irons/taylormade') do
    slim(:'setup/setup_irons_taylormade')
    
end

get('/setup/irons/cobra') do
    slim(:'setup/setup_irons_cobra')
    
end

post('/choosen/irons') do
    irons_model = params[:irons_model]
    session[:setup][:irons_model] = irons_model
    redirect('/setup/new/wedges')
end

get('/setup/new/wedges') do
    slim(:'setup/setup_wedges')
end

post('/setup/brand/wedges') do
    wedges_brand = params[:wedges_brand]
    session[:setup][:wedges_brand] = wedges_brand

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
    slim(:'setup/setup_wedges_titleist')
    
end

get('/setup/wedges/callaway') do
    slim(:'setup/setup_wedges_callaway')
    
end

get('/setup/wedges/taylormade') do
    slim(:'setup/setup_wedges_taylormade')
    
end

get('/setup/wedges/cobra') do
    slim(:'setup/setup_wedges_cobra')
    
end

post('/choosen/wedges') do
    wedges_model = params[:wedges_model]
    session[:setup][:wedges_model] = wedges_model
    redirect('/setup/new/putter')
end

get('/setup/new/putter') do
    slim(:'setup/setup_putter')
end

post('/setup/brand/putter') do
    putter_brand = params[:putter_brand]
    session[:setup][:putter_brand] = putter_brand


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
    slim(:'setup/setup_putter_titleist')
    
end

get('/setup/putter/callaway') do
    slim(:'setup/setup_putter_callaway')
    
end

get('/setup/putter/taylormade') do
    slim(:'setup/setup_putter_taylormade')
    
end

get('/setup/putter/cobra') do
    slim(:'setup/setup_putter_cobra')
    
end

post('/choosen/putter') do
    putter_model = params[:putter_model]
    session[:setup][:putter_model] = putter_model
    db = SQLite3::Database.new('db/setup_creator.db')
    count = db.execute("SELECT COUNT(*) FROM wedges WHERE user_id = ?", session[:id])[0][0]
order = count + 1

    db.execute("INSERT INTO woods (brand,model,user_id, `order`) VALUES (?,?,?,?) ", session[:setup][:woods_brand], session[:setup][:woods_model], session[:id], order)
    db.execute("INSERT INTO irons (brand,model,user_id, `order`) VALUES (?,?,?,?) ", session[:setup][:irons_brand], session[:setup][:irons_model], session[:id], order)
    db.execute("INSERT INTO wedges (brand,model,user_id, `order`) VALUES (?,?,?,?) ", session[:setup][:wedges_brand], session[:setup][:wedges_model], session[:id], order)
    db.execute("INSERT INTO putter (brand,model,user_id, `order`) VALUES (?,?,?,?) ", session[:setup][:putter_brand], session[:setup][:putter_model], session[:id], order)

    redirect('/setup/new')
end



# post('/choosen/wedges') do
#     redirect('/setup/new/putter')
# end





