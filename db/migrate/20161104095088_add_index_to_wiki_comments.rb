class AddIndexToWikiComments < ActiveRecord::Migration
  def change
    add_index :wiki_comments, :page
    add_index :wiki_comments, :title
    add_index :wiki_comments, :body
    add_index :culdcepts, :name
    add_index :culdcepts, :cost
    add_index :culdcepts, :card_cost
    add_index :culdcepts, :element_cost
    add_index :culdcepts, :st
    add_index :culdcepts, :hp
    add_index :culdcepts, :card_type
    add_index :culdcepts, :item_type
    add_index :culdcepts, :rare
    add_index :culdcepts, :deffensive
    add_index :culdcepts, :regenerate
    add_index :culdcepts, :first_attack
    add_index :culdcepts, :heritage
    add_index :culdcepts, :support
    add_index :culdcepts, :death 
    add_index :culdcepts, :magick 
    add_index :culdcepts, :cheer
    add_index :culdcepts, :strong_attack
    add_index :culdcepts, :fortitude
    add_index :culdcepts, :secret
    add_index :culdcepts, :mix
    add_index :culdcepts, :induction
    add_index :culdcepts, :element
    add_index :culdcepts, :forbidden_water
    add_index :culdcepts, :forbidden_fire
    add_index :culdcepts, :forbidden_forrest
    add_index :culdcepts, :forbidden_wind
    add_index :culdcepts, :forbidden_weapon
    add_index :culdcepts, :forbidden_armer
    add_index :culdcepts, :forbidden_item
    add_index :culdcepts, :forbidden_spell
  end
end                        
