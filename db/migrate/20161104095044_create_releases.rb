class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.text   :title
      t.date   :release_date
      t.text   :youtube_pv
      t.text   :asin
      t.string :hard_type
      t.timestamps
    end
  end
end
