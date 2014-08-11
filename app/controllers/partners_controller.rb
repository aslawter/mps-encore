class PartnersController < ApplicationController
  def show
    @partner = Partner.find(params[:id]) 
    @contact = Contact.new
    @contacts = @partner.contacts
  end

  def index
    @partner = Partner.new
    @partners = Partner.all
  end

  def create
    @partner = current_user.partners.new(partner_params)

    if @partner.save
      redirect_to :partners
    else
      @partners = Partner.all
      render :index
    end
  end

  private

  def partner_params
    params.require(:partner).
      permit(
        :name,
        :website,
       )
  end
end
