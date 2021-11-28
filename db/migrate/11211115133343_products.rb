class Products < ActiveRecord::Migration[6.1]
  def self.up
    create_table :products do |t|
       t.belongs_to :user
       t.column :name, :string, :limit => 100, :null => false
       t.column :price, :float, :null => false
       t.column :description, :text
       t.column :imageurl, :text
       t.column :isDeleted, :boolean, :default =>false
       t.column :quantity, :integer, :null => false
       t.column :created_at, :timestamp
    end
 end

 def self.down
    drop_table :products
 end
end
