class AddImageCreditToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :image_credit, :string
  end
end
