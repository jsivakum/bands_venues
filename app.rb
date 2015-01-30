require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
also_reload("lib/**/*.rb")


get '/' do
  @bands = Band.all

  erb :index
end

post '/band' do
  name = params[:name]
  Band.create(:name => name)
  redirect back
end

get '/band/:id' do
  @band = Band.find(params[:id])
  @venues = Venue.all
  erb :venue
end

delete '/delete_band/:id' do
  band_to_delete = Band.find(params[:id])
  band_to_delete.destroy
  redirect '/'
end
