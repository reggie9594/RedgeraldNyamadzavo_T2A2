class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
