class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    #:idがパスの中にない。
    #ルーティング（:post_image_id/favorites）が（）の記述になっているのでparams:idではなく，:post_image_idでidを取ってくる必要がある。
    #:は可変のURL。
    #ルーティングの取ってきたいURLが何かを見極める。
    
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    #記述は親子関係を考えて上から下る考え方
    #
    
    #①current_user.favorites.newで空の入れ物を作成して，user_idの中に現在ログインしているユーザーのidを入れている
    #②()の中でpost_image_id: post_image.idの記述でpost_image_id(入れたいカラムを記述)の中に入れたい値
    #4行目のpost_imageの入れた1レコードのidを代入されていく
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    
    
    
    #現在ログインしているユーザーのfavoriteテーブルの中で，post_image.idと同じidをもつpost_image_idのデータを探して
    #favoriteの中に入れる。入れるデータはあくまでidの数字だけ。ストロングパラメータで指定していない場合は1つのデータで
    #抜き出すことができる。
    
    favorite.destroy
    #post_image_idがfavoriteに格納されているのでこのidを削除すると，このidに紐づいている1レコード分のデータが削除される
    #削除，保存といった編集は同じモデル内でないとできない，モデルで紐づけされているので検索はできる．
    redirect_to post_image_path(post_image)
  end
  
end
