class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.valid?
      # Exemple d'action à effectuer, comme envoyer un email
      ContactMailer.with(contact_request: @contact_request).send_request.deliver_now
      flash[:notice] = "Votre demande a été envoyée avec succès."
      redirect_to root_path
    else
      flash[:alert] = "Veuillez corriger les erreurs du formulaire."
      render :new
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:first_name, :last_name, :company_name, :email, :phone_number, :message)
  end
end
