class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :destination
      t.integer :budget
      t.integer :group_size
      t.string :interests
      t.date :starts_on
      t.date :ends_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
