class ApplicationMailer < ActionMailer::Base
  default from: "nicolasdfgarric@gmail.com" # Adresse email par défaut
  layout "mailer"
end
