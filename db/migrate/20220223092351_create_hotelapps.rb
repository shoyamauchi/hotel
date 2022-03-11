class CreateHotelapps < ActiveRecord::Migration[6.1]
  def change
    create_table :hotelapps do |t|
      t.string :name
      t.text :intro
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
