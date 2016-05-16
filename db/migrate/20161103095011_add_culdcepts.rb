class AddCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :item_type, :string
    add_column :culdcepts, :forbidden_armer, :boolean
  end
end
