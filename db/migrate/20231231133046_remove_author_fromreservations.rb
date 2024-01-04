class RemoveAuthorFromreservations < ActiveRecord::Migration[6.1]
  def up
    remove_column :reservations, :confirming
    remove_column :reservations, :price
  end

  def down
    add_column :reservations, :confirming, :string
    add_column :reservations, :price, :integer
  end
end
