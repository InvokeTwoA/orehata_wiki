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
    # return redirect_to :back, alert: '現在、スパムコメントを防ぐためコメント機能を停止中です'

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
    if params[:wiki_comment][:project_id] == 'releases'
      redirect_to releases_path(project_id: 'releases'), time: Time.now.to_i, notice: 'コメントを投稿しました'
    else
      redirect_to game_wiki_path(project_id: params[:wiki_comment][:project_id], id: page, time: Time.now.to_i), notice: 'コメントを投稿しました'
    end

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
    unless WikiComment.is_correct_word?(params[:wiki_comment][:body])
      return redirect_to :back, alert: 'コメントにNGワードが含まれていたため投稿できませんでした。'
    end
    unless WikiComment.is_not_spam?(params[:wiki_comment][:body])
      return redirect_to :back, alert: 'スパムコメントを防ぐため半角文字の割合が多い投稿はブロクしております。申し訳ありませんが内容を修正の上、再度コメントしていただけましたら幸いです'
    end
  end
end
