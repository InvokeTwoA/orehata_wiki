class AddReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :point_graphic, :integer
    add_column :reviews, :point_volume, :integer
    add_column :reviews, :point_sound, :integer
    add_column :reviews, :point_system, :integer
    add_column :reviews, :point_satisfaction, :integer
    add_column :reviews, :point_difficulty, :integer
  end
end
