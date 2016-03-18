class WikiCommentsController < ApplicationController

  def create
    WikiComment.create(
      title: params[:wiki_comment][:title],
      body: params[:wiki_comment][:body],
      page: params[:wiki_comment][:page],
    )


    redirect_to :back,  notice: 'コメントを投稿しました。承認され次第、wikiに反映されますのでお待ちください。'
  end
end
