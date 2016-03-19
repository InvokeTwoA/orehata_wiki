class WikiCommentsController < ApplicationController

  def index
    @wiki_comments = WikiComment.all
  end

  def create
    WikiComment.create(
      title: params[:wiki_comment][:title],
      body: params[:wiki_comment][:body],
      page: params[:wiki_comment][:page],
    )
    redirect_to :back,  notice: 'コメントを投稿しました。承認され次第、wikiに反映されますのでお待ちください。'
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
