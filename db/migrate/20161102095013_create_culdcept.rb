class CreateCuldcept < ActiveRecord::Migration
  def change
    create_table :culdcepts do |t|
      t.string :name,       null: false
      t.integer :cost,       null: false
      t.integer :card_cost, default: 0
      t.string :element_cost
      t.integer :st
      t.integer :hp
      t.string :card_type
      t.string :rare
      t.boolean :deffensive
      t.string :element
      t.text   :description
      t.text   :advice
      t.boolean :forbidden_water
      t.boolean :forbidden_fire
      t.boolean :forbidden_forrest
      t.boolean :forbidden_wind
      t.boolean :forbidden_weapon
      t.boolean :forbidden_item
      t.boolean :forbidden_spell
      t.timestamps
    end
  end
end
