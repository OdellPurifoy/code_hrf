# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/updated_membership
class UpdatedMembershipPreview < ActionMailer::Preview
  def notify
    UpdateMembershipMailer.with(membership_id: membership_id).notify
  end

  private

  def membership_id
    Membership.last.id
  end
end
