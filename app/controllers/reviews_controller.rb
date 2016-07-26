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
    graph_data = [ 
      @game.average_point('point_volume'), 
      @game.average_point('point_graphic'), 
      @game.average_point('point_sound'), 
      @game.average_point('point_system'), 
      @game.average_point('point_difficulty')
    ]
    @chart = LazyHighCharts::HighChart.new('line') do |f|
      f.chart(
          polar: true,
          type: 'line'
        )
      f.title(
        text: "平均: #{@game.average_point('score')}点",
        x: -80
        )
      f.pane(size:'90%') 
      f.xAxis(
        categories: ['ボリューム', 'グラフィック', 'サウンド', 'システムの快適さ', '満足度'],
        tickmarkPlacement: 'on',
        lineWidth: 0
      )
      f.yAxis(
        gridLineInterpolation: 'polygon',
        lineWidth: 0,
        min: 0
      )
      f.series({
        name: 'Review',
        data: graph_data,
        pointPlacement: 'on'
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
