class CreateGwents < ActiveRecord::Migration
  def change
    add_column :gwents, :is_dwarf, :boolean
    add_column :gwents, :skill_command, :boolean
  end
end
