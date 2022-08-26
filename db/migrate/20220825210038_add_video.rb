class AddVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :video, :string
  end
end
