class AddRegenerateToCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :regenerate, :boolean
    add_column :culdcepts, :first_attack, :boolean
    add_column :culdcepts, :heritage, :boolean
    add_column :culdcepts, :support, :boolean
    add_column :culdcepts, :death, :boolean
    add_column :culdcepts, :magick, :boolean
    add_column :culdcepts, :strong_attack, :boolean
  end
end
