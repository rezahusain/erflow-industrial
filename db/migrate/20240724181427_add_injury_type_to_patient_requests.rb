class AddInjuryTypeToPatientRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :patient_requests, :injury_type, :string
  end
end
