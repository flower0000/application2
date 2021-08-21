class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image #_idは含めない
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  #validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェックします。
#trueと記述すると、データが存在しなければならないという設定になります。

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
    #存在していればtrue、存在していなければfalseを返す
  end
  
end
