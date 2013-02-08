class CompanyMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_mailer.password_reset.subject
  #
  def password_reset(company)
    @company = company

    mail to: user.email, subject: "Password Reset"
  end
end
