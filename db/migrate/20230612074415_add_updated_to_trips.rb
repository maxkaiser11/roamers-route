class AddUpdatedToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :updated, :boolean
  end
end
