class AddSpellTypeToCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :spell_type, :string
  end
end
