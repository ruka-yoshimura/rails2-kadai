class AddDetailsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_name, :string
    add_column :rooms, :room_detail, :text
    add_column :rooms, :fee, :integer
    add_column :rooms, :address, :string
    add_column :rooms, :room_img, :string
  end
end
