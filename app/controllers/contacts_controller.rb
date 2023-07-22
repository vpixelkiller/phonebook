class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy]

  def index
    query = params[:query]

    @contacts = Contact.all

    @contacts = Contact.where('surname LIKE ?', "%#{query}%") if query.present?
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @contact.destroy

    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :surname, :phone)
  end
end
