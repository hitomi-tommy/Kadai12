class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_destroy :destroy_last_admin_prohibited
  has_many :tasks, dependent: :destroy

  private
  def destroy_last_admin_prohibited
    # コールバックで処理を停止したい時は、throw :abortする。selfをつけ、クラスメソッドを定義する。
    throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
  end

end
