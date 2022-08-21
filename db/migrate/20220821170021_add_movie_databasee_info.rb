class AddMovieDatabaseeInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rtscore, :integer
    add_column :movies, :mcscore, :integer
    add_column :movies, :genre, :string
    add_column :movies, :cast, :string
    add_column :movies, :year, :string
    add_column :movies, :saved, :boolean

    remove_column :movies, :rating
  end
end
