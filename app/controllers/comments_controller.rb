class CommentsController < ApplicationController
  # def create
  #   Comment.create(comment_params)
  # end
 def create
   @comment = Comment.new(comment_params)
   @prototype = @comment.prototype
  #  @prototype = @comment.prototype
  #  @comments = @prototype.comments.includes(:user)

  if @comment.save
     redirect_to prototype_path(@comment.prototype)
  else

     render template: "prototypes/show"
#     @prototype = @comment.prototype
#     @comments = @prototype.commentsshoe
  end
end
#   @comment = Comment.new(comment.params)
#   if @comment.save
#     redirect_to prototype_path(@comment.prototype)
#   else
#     render :edit
#  end
 
  private
 def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
 end
end
  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     redirect_to tweet_path(@comment.tweet) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
  #   else
  #     @tweet = @comment.tweet
  #     @comments = @tweet.comments
  #     render "tweets/show" # views/tweets/show.html.erbのファイルを参照しています。
  #   end
  # end

