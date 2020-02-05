class AddGenreToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :genre, :string
  end
end
