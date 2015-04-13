require_relative 'rolodex'
require 'sinatra'
require 'data_mapper'

$rolodex = Rolodex.new


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
	@crm_app_name = "Frank's CRM"
	erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "Frank's CRM"
	erb :new_contact
end

get '/contacts/:id/edit' do
	@crm_app_name = "Frank's CRM"
	@contact = $rolodex.find(params[:id])
	erb :modify_contact
end

get '/contacts/:id' do
	@crm_app_name = "Frank's CRM"
	@contact = $rolodex.find(params[:id])	
	erb :show
end

put '/contacts/:id' do
	contact = $rolodex.find(params[:id])
	contact.first_name = params[:first_name]
	contact.last_name = params[:last_name]
	contact.email = params[:email]
	contact.notes = params[:notes]

	redirect to ('/contacts')
end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
    $rolodex.add_contact(new_contact)
    redirect to('/contacts')
end


delete '/contacts/:id' do
	contact = $rolodex.find(params[:id])
	$rolodex.delete_contact(contact)
	redirect to('/contacts')
end

$rolodex.add_contact(Contact.new("Matt", "Holtom", "matt@gmail.com", "sad"))
$rolodex.add_contact(Contact.new("Frank", "Xu", "frank@gmail.com", "happy"))

