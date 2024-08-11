# frozen_string_literal: true

class AddRankToPatientRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :patient_requests, :rank, :integer
  end
end
