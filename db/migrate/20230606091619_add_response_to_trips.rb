class AddResponseToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :response, :text
  end
end
