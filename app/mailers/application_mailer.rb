# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@coinmachine.com'
  layout 'mailer'
end
