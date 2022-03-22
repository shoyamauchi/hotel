class RenameEndColumnToRents < ActiveRecord::Migration[6.1]
  def change
    rename_column :rents, :start, :start_date
    rename_column :rents, :end, :end_date
  end
end
