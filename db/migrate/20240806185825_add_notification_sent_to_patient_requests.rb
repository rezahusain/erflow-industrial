class AddNotificationSentToPatientRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :patient_requests, :notification_sent, :boolean
  end
end
