class AddFortitudeToCuldcepts < ActiveRecord::Migration
  def change
    add_column :culdcepts, :fortitude, :boolean
    add_column :culdcepts, :secret, :boolean
    add_column :culdcepts, :mix, :boolean
    add_column :culdcepts, :induction, :boolean
  end
end
