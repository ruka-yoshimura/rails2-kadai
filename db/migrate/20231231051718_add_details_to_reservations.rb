class AddDetailsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :confirming, :string
  end
end
