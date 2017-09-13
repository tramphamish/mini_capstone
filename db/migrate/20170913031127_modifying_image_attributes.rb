class ModifyingImageAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :image_1, :name
    rename_column :images, :image_2, :image
    rename_column :images, :image_3, :description
  end
end
