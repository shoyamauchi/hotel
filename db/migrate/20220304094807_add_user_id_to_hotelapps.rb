class AddUserIdToHotelapps < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM hotelapps;'
    add_reference :hotelapps, :user, null: false, index: true
  end

  def down
    remove_reference :hotelapps, :user, index: true
  end
end
