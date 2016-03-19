class FixAwikiComment < ActiveRecord::Migration
  def self.change
    change_column :wiki_comments, :active_flag, :boolean
  end
end
