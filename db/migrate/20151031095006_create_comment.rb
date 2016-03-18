class CreateWikiComment < ActiveRecord::Migration
  def self.up
    create_table :wiki_comments do |t|
      t.string :page
      t.text :title
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_comments
  end
end
