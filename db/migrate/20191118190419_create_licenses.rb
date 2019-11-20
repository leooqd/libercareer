# frozen_string_literal: true

class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.string :number, null: false, default: ''
      t.date :expiration, null: false, default: ''
      t.references :person, index: true, null: false
      t.integer :modalities_ids, array: true, default: []
      t.timestamps
    end
  end
end
