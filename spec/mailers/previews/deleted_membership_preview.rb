# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/deleted_membership
class DeletedMembershipPreview < ActionMailer::Preview
  def notify
    DeletedMembershipMailer.with(membership_id: membership_id).notify
  end

  private

  def membership_id
    Membership.last.id
  end
end
