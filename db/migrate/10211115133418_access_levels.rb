class AccessLevels < ActiveRecord::Migration[6.1]
  def self.up
    create_table :access_levels do |t|
       t.column :name, :string,:null => false
       t.column :created_at, :timestamp
    end
 end

 def self.down
    drop_table :access_levels
 end
end
