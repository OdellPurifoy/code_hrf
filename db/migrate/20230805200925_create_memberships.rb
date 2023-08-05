# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships, id: :uuid do |t|
      t.string :first_name,     null: false
      t.string :last_name,      null: false
      t.string :email,          null: false
      t.string :phone_number
      t.boolean :do_not_text,   default: false
      t.boolean :do_not_email,  default: false
      t.boolean :active,        default: true
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
