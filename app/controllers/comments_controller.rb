class CommentsController < ApplicationController

  http_basic_authenticate_with name: "diamond", password: "1234", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.expect(comment: [:commenter, :body])
    end
end
