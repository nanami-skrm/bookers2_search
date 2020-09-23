class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}


 	def User.search(search, how_search)
        if how_search == "1"
            User.where(['name LIKE ?', "%#{search}%"])
        elsif how_search == "2"
            User.where(['name LIKE ?', "%#{search}"])
        elsif how_search == "3"
            User.where(['name LIKE ?', "#{search}%"])
        elsif how_search == "4"
            User.where(['name LIKE ?', "#{search}"])
        else
            User.all
        end
    end
end
