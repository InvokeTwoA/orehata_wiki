#    t.string :name,       null: false
#    t.integer :cost,       null: false
#    t.integer :card_cost, default: 0
#    t.string :element_cost
#    t.integer :st
#    t.integer :hp
#    t.string :card_type
#    t.string :item_type
#    t.string :rare
#    t.boolean :deffensive
#    t.string :element
#    t.text   :card_text
#    t.text   :description
#    t.text   :advice
#    t.boolean :forbidden_water
#    t.boolean :forbidden_fire
#    t.boolean :forbidden_forrest
#    t.boolean :forbidden_wind
#    t.boolean :forbidden_weapon
#    t.boolean,:forbidden_armer
#    t.boolean :forbidden_item
#    t.boolean :forbidden_spell
class Culdcept < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }

  validates :name, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :st, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hp, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
