class AddQueuePositionToPatientRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :patient_requests, :queue_position, :integer
  end
end
