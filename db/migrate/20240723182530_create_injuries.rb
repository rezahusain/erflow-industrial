class CreateInjuries < ActiveRecord::Migration[7.1]
  def change
    create_table :injuries do |t|
      t.integer :priority
      t.string :name
      t.integer :patient_request_id

      t.timestamps
    end
  end
end
