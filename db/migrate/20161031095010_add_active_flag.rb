class AddActiveFlag < ActiveRecord::Migration
  def self.up
    add_column :wiki_comments, :active_flag, :boolean
  end

  def self.down

  end

end
