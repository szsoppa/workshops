class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists, id: false do |t|
      t.primary_key :id
      t.timestamps
    end
  end
end
