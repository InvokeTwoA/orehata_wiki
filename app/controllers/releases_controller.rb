class ReleasesController < ApplicationController
  inherit_resources

  def all
    @releases = Release.recent.page(params[:page]).per(30).uniq
    render :index
  end

  private
  def collection
    @releases = Release.active.recent.page(params[:page]).per(30).uniq
  end
end
