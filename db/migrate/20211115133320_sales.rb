class Sales < ActiveRecord::Migration[6.1]
  def self.up
    create_table :sales do |t|
      t.belongs_to :product, :foreign_key=> "productId"
       t.column :date, :date,:null => false
       t.column :price, :float, :null => false
       t.column :quantity, :integer, :null => false
       t.column :created_at, :timestamp
    end
 end

 def self.down
    drop_table :sales
 end
end
