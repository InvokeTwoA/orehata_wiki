class ReleasesController < ApplicationController
  inherit_resources

  private
  def collection
    @releases = Release.active.recent.page(params[:page]).per(30).uniq
  end
end
