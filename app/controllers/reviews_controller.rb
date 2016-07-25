class ReviewsController < ApplicationController
  inherit_resources

  # レビュー 一覧
  def index
    @games = Game.recent
  end

  # レビュー詳細画面
  def game
    @game = Game.find params[:game_id]

    # グラフ描画
    graph_data = []
    graph_data.push ['ボリューム',       @game.average_point('point_volume')]
    graph_data.push ['グラフィック',     @game.average_point('point_graphic')]
    graph_data.push ['サウンド',         @game.average_point('point_sound')]
    graph_data.push ['システムの快適さ', @game.average_point('point_system')]
    graph_data.push ['満足度',           @game.average_point('point_difficulty')]
    @chart = LazyHighCharts::HighChart.new('radar') do |f|
      f.pane(size:'90%') 
      f.series({
        name: 'Review',
        data: graph_data
      })
    end
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
