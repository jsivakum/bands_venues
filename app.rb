require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
also_reload("lib/**/*.rb")


get('/') do
  @bands = Band.all

  erb :index
end

post('/band') do
  name = params[:name]
  Band.create(:name => name)
  redirect back
end

get('/band/:id') do

  erb: venue
end
