class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.date :start, null: false
      t.date :end, null: false
      t.integer :number, null: false, default: '0'

      t.timestamps
    end
  end
end
