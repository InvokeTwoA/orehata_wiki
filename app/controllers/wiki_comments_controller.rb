class WikiCommentsController < ApplicationController

  before_filter :check_spam, only: [:create]
  

  def index
    if params[:project_id].present?
      @wiki_comments = WikiComment.recent.where(project_id: params[:project_id]).page(params[:kaminari_page]).per(20)
    else
      @wiki_comments = WikiComment.recent.page(params[:kaminari_page]).per(20)
    end
  end

  def create
    return redirect_to :back, alert: 'コメント内容が空です' if params[:wiki_comment][:body].blank?

    if params[:wiki_comment][:page] == '' || params[:wiki_comment][:page] == 'Wiki'
      page = 'wiki'
    else
      page = params[:wiki_comment][:page]
    end
    WikiComment.create(
      project_id: params[:wiki_comment][:project_id],
      title: params[:wiki_comment][:title],
      body: params[:wiki_comment][:body],
      page: page,
    )
    redirect_to :back,  notice: 'コメントを投稿しました。'
  end

  def destroy
    wiki_comment = WikiComment.find params[:id]
    wiki_comment.destroy
    redirect_to :back
  end

  # PUT 有効にする
  def to_active
    wiki_comment = WikiComment.find params[:id]
    wiki_comment.active_flag = true
    wiki_comment.save!
    redirect_to :back
  end

  # PUT 無効にする
  def to_inactive
    wiki_comment = WikiComment.find params[:id]
    wiki_comment.active_flag = false
    wiki_comment.save!
    redirect_to :back
  end

  private
  def check_spam
    unless params[:wiki_comment][:body].match(/Hello\!/).nil?
      return redirect_to :back, alert: 'コメントに Hello! を含む投稿はできません'
    end
  end
end
