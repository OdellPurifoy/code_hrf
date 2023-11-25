# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates_presence_of :body

  scope :read, -> { where(read: true) }
  scope :unread, -> { where(read: false) }
end
