class ContactMailer < ApplicationMailer
  def send_request
    @contact_request = params[:contact_request]
    mail(to: "nicolasdfgarric@gmail.com", subject: "Nouvelle demande de devis")
  end
end
