class FixWikiComment < ActiveRecord::Migration
  def self.change
    add_column :wiki_comments, :active_flag, :boolean
  end

end
