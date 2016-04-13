class WikiCommentsController < ApplicationController
  def index
    @wiki_comments = WikiComment.recent.page(params[:kaminari_page]).per(10)
  end

  def create
    return redirect_to :back, alert: 'コメント内容が空です' if params[:wiki_comment][:body].blank?


    if params[:wiki_comment][:page] == '' || params[:wiki_comment][:page] == 'Wiki'
      page = 'wiki'
    else
      page = params[:wiki_comment][:page]
    end
    WikiComment.create(
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
end
