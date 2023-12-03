# frozen_string_literal: true

class NewMemberWelcomeMailer < ApplicationMailer
  def send_welcome_email
    @member = Membership.find(params[:membership_id])
    @lounge = Lounge.find(params[:lounge_id])

    mail(
      from: 'herf@gmail.com',
      to: @member.email,
      subject: 'Welcome to Herf!'
    )
  end
end
