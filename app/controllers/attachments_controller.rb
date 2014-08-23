class AttachmentsController < ApplicationController
  def new
    @solicitation = Solicitation.find(params[:solicitation_id])
    @attachment = Attachment.new
  end

  def create
    @solicitation = Solicitation.find(params[:solicitation_id])
    @attachment = current_user.attachments.new(
      attachment_params.merge(
        solicitation: @solicitation,
        updated_by_id: current_user.id
      )
    )

    if @attachment.save
      redirect_to @solicitation
    else
      render :new
    end
  end

  private

  def attachment_params
    params.require(:attachment).
      permit(
        :file
      )
  end
end
