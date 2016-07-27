class Admin::ReleasesController < Admin::ApplicationController
  inherit_resources

  def all
    @releases = Release.recent.page(params[:page]).per(30).uniq
    render :index
  end

  def create
    create! do
      redirect_to admin_releases_path, notice: 'ゲームを追加しました' and return
    end
  end

  def update
    update! do
      redirect_to admin_releases_path, notice: 'ゲームを編集しました' and return
    end
  end

  def destroy
    destroy! do
      redirect_to admin_releases_path, notice: 'ゲームを削除しました' and return
    end
  end

  private
  def collection
    @releases = Release.active.recent.page(params[:page]).per(30).uniq
  end
  
  def release_params
    params.require(:release).permit(
      :title,
      :release_date,
      :asin,
      :youtube_pv,
      :hard_type
    )
  end

end
