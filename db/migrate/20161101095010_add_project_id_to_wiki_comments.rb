class AddProjectIdToWikiComments < ActiveRecord::Migration
  def self.up
    add_column :wiki_comments, :project_id, :string

    WikiComment.all.each do |wiki_comment|
      if wiki_comment.project_id.blank? || wiki_comment.project_id == 0
        wiki_comment.project_id = 'orehata_tori'
        wiki_comment.save!
      end
    end
  end

  def self.down
    remove_column :wiki_comments, :project_id
  end

end
