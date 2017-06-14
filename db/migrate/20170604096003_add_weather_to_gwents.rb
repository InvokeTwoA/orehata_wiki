class AddGwents < ActiveRecord::Migration
  def change
    add_column :gwents, :is_weather, :boolean
  end
end
