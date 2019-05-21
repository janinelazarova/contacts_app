class Api::ContactsController < ApplicationController
  
  before_action :authenticate_user

  def index
    @contacts = current_user.contacts
    
    if params[:first_name]
      @contacts = @contacts.where("first_name iLIKE ?", "%#{params[:first_name]}%")
    end  

    if params[:last_name]
      @contacts = @contacts.where(last_name: "#{params[:last_name]}")
    end  

    render 'index.json.jbuilder'
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'    
  end

  def create
    @contact = Contact.new(
         first_name: params[:first_name],
         last_name: params[:last_name],
         email: params[:email],
         phone_number: params[:phone_number],
         user_id: current_user.id
      )

    if @contact.save
      # happy path
      render 'show.json.jbuilder'
    else
      # sad path
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
   
  end


  def update
    @contact = Contact.find(params[:id])
    
      @contact.first_name = params[:first_name] || @contact.first_name
      @contact.last_name = params[:last_name] || @contact.last_name
      @contact.email = params[:email] || @contact.email
      @contact.phone_number = params[:phone_number] || @contact.phone_number
      
      if @contact.save
        # happy path
        render 'show.json.jbuilder'
      else
        # sad path
        render json: {errors: @contact.errors.full_messages}, status: 422
      end
     
     

  end


  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    
  end
end
