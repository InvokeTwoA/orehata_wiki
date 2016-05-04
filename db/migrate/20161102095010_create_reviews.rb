class CreateReviews < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title,       null: false
      t.string :asin
      t.date   :release_date
      t.text   :pv_url
      t.integer :total_score
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :game_id,    null: false
      t.integer :score,      null: false
      t.string :created_by
      t.string :title,       null: false
      t.text :body_good,     null: false
      t.text :body_bad,      null: false
      t.text :body_free,     null: false
      t.timestamps
    end
  end
end
