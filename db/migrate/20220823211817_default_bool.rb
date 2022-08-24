class DefaultBool < ActiveRecord::Migration[7.0]
  def change
    change_column_default :movies, :saved, false
  end
end
