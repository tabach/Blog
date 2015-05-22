class LikesController<ApplicationController
  def like
    @post = Post.find(params[:post_id])
    #@like = Like.where(post_id:"#{params[:post_id]}", user_id: "#{current_user.id}")
    @like = Like.where(["post_id = ? and user_id = ?", params[:post_id], current_user.id]).first
     #byebug
    if @like
      Like.find(@like.id).destroy
    else
      Like.create(flag:true,post_id:params[:post_id],user_id:current_user.id)
    end
    redirect_to posts_path
  end
end
