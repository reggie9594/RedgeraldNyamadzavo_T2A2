class Users < ActiveRecord::Migration[6.1]
  def self.up
    create_table :users do |t|
      t.belongs_to :access_level
       t.column :name, :string,:null => false
       t.column :email, :string, :null => false
       t.column :password, :string, :null => false
       t.column :address, :string, :null => false
       t.column :created_at, :timestamp
    end
 end

 def self.down
    drop_table :users
 end
end
