class AddUserIdToRents < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM rents;'
    add_reference :rents, :user, null: false, index: true
  end

  def down
    remove_reference :rents, :user, index: true
  end
end
