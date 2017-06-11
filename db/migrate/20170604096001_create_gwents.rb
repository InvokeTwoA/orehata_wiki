class CreateGwents < ActiveRecord::Migration
  def change
    create_table :gwents do |t|
      t.string :name,       null: false
      t.integer :bp
      t.string :card_type,  null: false
      t.string :color_type, null: false
      t.string :rare
      t.string :war_group
      t.string :speciality
      t.string :position
      t.text   :description
      t.text   :card_text
      t.string :review_rank

      t.boolean :skill_adrenalin
      t.boolean :is_elf
      t.timestamps
    end
  end
end
