class AddHotelIdToRents < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM rents;'
    add_reference :rents, :hotelapp, null: false, index: true
  end

  def down
    remove_reference :rents, :hotelapp, index: true
  end
end
