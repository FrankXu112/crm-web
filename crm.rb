require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@crm_app_name = "Frank's CRM"
	erb :index
end

get '/contacts' do
	@contacts = Contact.all
	@crm_app_name = "Frank's CRM"
	erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "Frank's CRM"
	erb :new_contact
end

get '/contacts/:id/edit' do
	@crm_app_name = "Frank's CRM"
	@contact = Contact.get(params[:id])
	erb :modify_contact
end

get '/contacts/:id' do
	@crm_app_name = "Frank's CRM"
	@contact = Contact.get(params[:id])	
	erb :show
end

put '/contacts/:id' do
	contact = Contact.get(params[:id])
	contact.first_name = params[:first_name]
	contact.last_name = params[:last_name]
	contact.email = params[:email]
	contact.notes = params[:notes]
	contact.save
	redirect to ('/contacts')
end

post '/contacts' do
	contact = Contact.create({
		:first_name => params[:first_name], 
		:last_name => params[:last_name], 
		:email =>params[:email], 
		:notes => params[:notes]
		})
   
    redirect to('/contacts')
end


delete '/contacts/:id' do
	contact = Contact.get(params[:id])
	contact.destroy
	redirect to('/contacts')
end

