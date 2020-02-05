class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.integer :goal_id
      t.integer :user_id
      t.string :content
      t.datetime :date

      t.timestamps
    end
  end
end
