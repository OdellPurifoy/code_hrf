# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name,               null: false
      t.string :event_type,         null: false
      t.string :event_url
      t.string :zoom_code
      t.boolean :rsvp_needed, null: false, default: false
      t.integer :maximum_capacity
      t.time :start_time,           null: false
      t.time :end_time,             null: false
      t.boolean :members_only,      null: false, default: false
      t.boolean :is_virtual
      t.text :event_description,    null: false
      t.date :event_date,           null: false
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
