class ReviewsController < ApplicationController
  inherit_resources

  # レビュー 一覧
  def index
    @games = Game.recent
  end
 
  def new
    @game = Game.find params[:game_id]
  end

  def create
    create! do
      redirect_to reviews_path, notice: 'レビューの投稿が完了しました' and return
    end
  end

  def review_params
    params.require(:review).permit(
      :game_id,
      :score,
      :title,
      :body_good,
      :body_bad,
      :body_free,
      :point_graphic,
      :point_volume, 
      :point_sound,
      :point_system, 
      :point_satisfaction,
      :point_difficulty,
    )
  end

end
