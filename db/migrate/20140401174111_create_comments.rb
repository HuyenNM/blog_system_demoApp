class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contend
      t.integer :user_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
