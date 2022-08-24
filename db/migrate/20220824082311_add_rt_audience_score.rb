class AddRtAudienceScore < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rtauscore, :integer
  end
end
