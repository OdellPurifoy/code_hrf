class AddFieldsToLounge < ActiveRecord::Migration[7.0]
  def change
    add_column :lounges, :alcohol_served, :boolean, default: false
    add_column :lounges, :food_served, :boolean, default: false
    add_column :lounges, :outside_alcohol_allowed, :boolean, default: false
    add_column :lounges, :outside_cigars_allowed, :boolean, default: false
  end
end
