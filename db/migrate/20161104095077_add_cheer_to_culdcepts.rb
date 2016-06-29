class AddCheerToCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :cheer, :boolean
  end
end
