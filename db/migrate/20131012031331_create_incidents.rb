class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.datetime :last_seen, null: false
      t.string :last_location, null: false

      t.float :latitude
      t.float :longitude

      t.string :police_incident_number
      t.string :officer_name
      t.string :station

      t.boolean :resolved, default: false, null: false
      t.references :bike, index: true, null: false

      t.timestamps
    end
  end
end
