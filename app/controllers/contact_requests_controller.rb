class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    if @contact_request.save
      # Envoi de l'email avec la demande de devis
      ContactMailer.with(contact_request: @contact_request).send_request.deliver_now
      flash[:notice] = "Votre demande a été envoyée avec succès."
      redirect_to root_path
    else
      flash.now[:alert] = "Une erreur est survenue lors de l'envoi de votre demande. Veuillez corriger les erreurs ci-dessous."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:first_name, :last_name, :company_name, :email, :phone_number, :message, :start_date, :end_date)
  end
end
