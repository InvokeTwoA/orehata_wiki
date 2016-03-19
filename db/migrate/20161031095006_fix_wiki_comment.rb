class CreateWikiComment < ActiveRecord::Migration
  def self.change
    add_column :wiki_comments, :active_flag
  end

end
