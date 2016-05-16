class AddCardTextToCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :card_text, :text
  end
end
