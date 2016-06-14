class AddProtectSpell < ActiveRecord::Migration
  def change
    add_column :culdcepts, :protect_spell, :boolean
  end
end
