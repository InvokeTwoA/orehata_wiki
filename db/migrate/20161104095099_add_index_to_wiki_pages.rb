class AddIndexToWikiPages < ActiveRecord::Migration
  def change
    add_index :wiki_pages, :title
    add_index :wiki_pages, [:wiki_id, :title]
  end
end                        
