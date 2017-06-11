class GwentsController < ApplicationController
  inherit_resources
  before_filter :set_sidebar, only: [:index, :new, :edit]
  respond_to :js

  def create
    create! do
      redirect_to gwents_path(card_id: resource.id), notice: 'カードの登録が完了しました' and return
    end
  end

  def update
    update! do
      redirect_to gwents_path(card_id: resource.id), notice: 'カードの編集が完了しました' and return
    end
  end

  private
  def collection
    @cond ||= params[:q] || {}
    @q = end_of_association_chain.search(@cond)
    @culdcepts = @q.result.recent.page(params[:kaminari_page]).per(30).uniq
  end

  def gwent_params
    params.require(:culdcept).permit(
      :name,
      :card_type,
      :bp,
      :color_type,
      :rare,
      :war_group,
      :speciality,
      :position,
      :description,
      :card_text,
      :review_rank,
      :is_elf,
      :skill_adrenalin,
    )
  end

  def set_sidebar
    @project = Project.find('gwent')
    @wiki = @project.wiki
    @page = @wiki.find_or_new_page('top')
    params[:project_id] = 'gwent'
    params[:id] = 'top' if params[:id].blank?
  end

end
