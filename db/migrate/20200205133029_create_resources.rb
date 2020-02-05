class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.integer :goal_id
      t.integer :user_id
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
