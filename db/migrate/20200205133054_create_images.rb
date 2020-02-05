class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :goal_id
      t.integer :user_id
      t.string :url
      t.string :caption

      t.timestamps
    end
  end
end
