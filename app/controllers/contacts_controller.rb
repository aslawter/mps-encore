class ContactsController < ApplicationController
  def index
    @customer_contacts = Contact.customer
    @partner_contacts = Contact.partner
  end

  def new
    @organization = find_organization
    @contact = Contact.new
  end

  def create
    @organization = find_organization
    @contact = Contact.new(contact_params.merge(organization: @organization))

    if @contact.save
      redirect_to @organization
    else
      render :new
    end
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
