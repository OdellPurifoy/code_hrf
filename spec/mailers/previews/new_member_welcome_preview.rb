# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/new_member_welcome
class NewMemberWelcomePreview < ActionMailer::Preview
  def send_welcome_email
    NewMemberWelcomeMailer.with(membership_id: membership_id, lounge_id: lounge_id).send_welcome_email
  end

  private

  def membership_id
    Membership.last.id
  end

  def lounge_id
    Lounge.last.id
  end
end
