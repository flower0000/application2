class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    #ユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができる。
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    #ストロングパラメータであるuser_paramsに新たな情報がレコードとして更新されるようになる．
    redirect_to user_path(@user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
