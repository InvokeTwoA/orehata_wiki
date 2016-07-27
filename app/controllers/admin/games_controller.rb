class Admin::GamesController < Admin::ApplicationController
  inherit_resources

  def create
    create! do
      redirect_to admin_games_path, notice: 'ゲームを追加しました' and return
    end
  end

  def update
    update! do
      redirect_to admin_games_path, notice: 'ゲームを編集しました' and return
    end
  end

  def destroy
    destroy! do
      redirect_to admin_games_path, notice: 'ゲームを削除しました' and return
    end
  end

  private
  def collection
    @games = Game.recent.page(params[:page]).per(30).uniq
  end
  
  def game_params
    params.require(:game).permit(
      :title,
      :asin,
      :asin_mini,
      :hard_type,
      :release_date,
      :pv_url,
      :total_score
    )
  end

end
