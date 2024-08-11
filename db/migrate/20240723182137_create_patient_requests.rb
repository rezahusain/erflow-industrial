# frozen_string_literal: true

class CreatePatientRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_requests do |t|
      t.integer :user_id
      t.text :description
      t.string :image
      t.string :status
      t.integer :pain

      t.timestamps
    end
  end
end
