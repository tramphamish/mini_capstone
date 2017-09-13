class ChangeSupplierIdToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :supplier_id, :integer
  end
end
