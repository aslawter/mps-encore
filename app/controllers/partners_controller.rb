class PartnersController < ApplicationController
  def index
    @partner = Partner.new
    @partners = Partner.all
  end

  def create
    @partner = Partner.new(partner_params)

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
