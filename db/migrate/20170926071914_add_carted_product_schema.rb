class AddCartedProductSchema < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :title, :string
    add_column :product_categories, :category_id, :integer
    add_column :product_categories, :product_id, :integer
    remove_column :images, :description, :string
    rename_column :images, :image, :url
  end
end
