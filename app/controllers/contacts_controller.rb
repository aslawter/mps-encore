class ContactsController < ApplicationController
  def new
    @organization = find_organization
    @contact = Contact.new
  end

  def create
    @organization = find_organization
    @contact = current_user.contacts.new(contact_params.merge(organization: @organization))

    if @contact.save
      redirect_to @organization
    else
      render :new
    end
  end

  def index
    @customer_contacts = Contact.customers
    @partner_contacts = Contact.partners
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def find_partner
    Partner.find_by(id: params[:partner_id])
  end

  def find_customer
    Customer.find_by(id: params[:customer_id])
  end

  def find_organization
    find_partner || find_customer
  end

  def contact_params
    params.require(:contact).
      permit(
        :first_name,
        :last_name,
        :title,
        :email,
        :phone,
        :fax,
      )
  end
end
