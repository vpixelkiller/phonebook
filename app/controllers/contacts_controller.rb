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
      redirect_to root_path, notice: t('contact_created')
    else
      response = generate_response

      render :new, notice: response
    end
  end

  def destroy
    @contact.destroy

    redirect_to contacts_url, notice: t('contact_destroyed')
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :surname, :phone)
  end

  def generate_response
    errors = @contact.errors.full_messages

    return errors.first unless errors.empty?

    t('failed_create_contact')
  end
end
