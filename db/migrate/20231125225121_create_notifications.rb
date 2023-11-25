# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.text :body, null: false
      t.boolean :read
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
