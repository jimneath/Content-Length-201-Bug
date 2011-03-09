class CreateApples < ActiveRecord::Migration
  def self.up
    create_table :apples do |t|
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :apples
  end
end
