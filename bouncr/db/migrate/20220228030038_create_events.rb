class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :startTime
      t.datetime :endTime
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip
      t.text :description
      t.boolean :attendenceVisible
      t.boolean :friendsAttendingVisible
      t.integer :attendenceCap
      t.float :coverCharge
      t.boolean :isOpenInvite
      t.float :venueLatitude
      t.float :venueLongitude

      t.timestamps
    end
  end
end
