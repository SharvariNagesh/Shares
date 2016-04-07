class AddSectorToShares < ActiveRecord::Migration
  def change
    add_column :shares, :sector, :string
  end
end
