class CuldceptsController < ApplicationController
  inherit_resources
  before_filter :set_sidebar, only: [:index, :new, :edit]
  before_filter :get_activities, only: [:index]
  respond_to :js

  def create
    create! do
      redirect_to culdcepts_path(card_id: resource.id), notice: 'カードの登録が完了しました' and return
    end
  end

  def update
    update! do
      redirect_to culdcepts_path(card_id: resource.id), notice: 'カードの編集が完了しました' and return
    end
  end
  
  private
  def collection
    @cond ||= params[:q] || {}
    @q = end_of_association_chain.search(@cond)
    @culdcepts = @q.result.recent.page(params[:kaminari_page]).per(30).uniq
  end

  def culdcept_params
    params.require(:culdcept).permit(
      :name,
      :cost, 
      :card_cost,
      :element_cost,
      :st,
      :hp,
      :card_type,
      :item_type,
      :spell_type,
      :rare,
      :deffensive,
      :regenerate,
      :first_attack,
      :protect_spell,
      :heritage,
      :support,
      :death ,
      :magick, 
      :cheer,
      :strong_attack,
      :fortitude,
      :secret,
      :mix,
      :induction,
      :element,
      :card_text,
      :description,
      :advice,
      :forbidden_water,
      :forbidden_fire,
      :forbidden_forrest,
      :forbidden_wind,
      :forbidden_weapon,
      :forbidden_armer,
      :forbidden_item,
      :forbidden_spell
    )
  end

  def set_sidebar
    @project = Project.find('culdcept')
    @wiki = @project.wiki
    @page = @wiki.find_or_new_page('top')
    params[:project_id] = 'culdcept'
    params[:id] = 'top' if params[:id].blank?
  end

  def get_activities
    @days = Setting.activity_days_default.to_i
    @date_to ||= Date.today + 1
    @date_from = @date_to - @days
    @activity = Redmine::Activity::Fetcher.new(User.current, :project => @project)
    pref = User.current.pref
    @activity.scope_select {|t| !params["show_#{t}"].nil?}
    @activity.scope = :all
    events = @activity.events(@date_from, @date_to)

    if events.empty? || stale?(:etag => [@activity.scope, @date_to, @date_from, @with_subprojects, @author, events.first, events.size, User.current, current_language])
      respond_to do |format|
        format.html {
          @events_by_day = events.group_by {|event| User.current.time_to_date(event.event_datetime)}
          render :layout => false if request.xhr?
        }
        format.atom {
          title = l(:label_activity)
          if @author
            title = @author.name
          elsif @activity.scope.size == 1
            title = l("label_#{@activity.scope.first.singularize}_plural")
          end
          render_feed(events, :title => "#{@project || Setting.app_title}: #{title}")
        }
      end
    end
  end
end
