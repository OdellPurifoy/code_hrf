# frozen_string_literal: true

class DeletedMembershipMailer < ApplicationMailer
  def notify
    @member = Membership.find(params[:membership_id])

    mail(
      from: 'herf@gmail.com',
      to: @member.email,
      subject: 'Your membership has been canceled'
    )
  end
end
