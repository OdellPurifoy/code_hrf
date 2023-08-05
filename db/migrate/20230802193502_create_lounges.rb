# frozen_string_literal: true

class CreateLounges < ActiveRecord::Migration[7.0]
  def change
    create_table :lounges, id: :uuid do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false
      t.string :email,        null: false
      t.text :description
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
