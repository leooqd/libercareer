# frozen_string_literal: true

class CreateAutomobiles < ActiveRecord::Migration[5.2]
  def change
    create_table :automobiles do |t|
      t.string :color, null: false, default: ''
      t.string :model, null: false, default: ''
      t.string :year
      t.string :license_plate, null: false, default: ''
      t.integer :kind, null: false, default: 0
      t.decimal :cost, null: false, default: 0.0
      t.timestamps
    end
  end
end
