class CreateAccessLevelActions < ActiveRecord::Migration[6.1]
  def self.up
    create_table :access_level_actions do |t|
      t.belongs_to :access_level
       t.column :action, :string,:null => false
       t.column :created_at, :timestamp
    end
 end

 def self.down
    drop_table :access_level_actions
 end
end
