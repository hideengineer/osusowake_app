class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  def remember_me
    true
  end

  VALID_PHONE = /\A\d{10,11}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_LAST_NAME_KANA = /\A([ァ-ン]|ー)+\z/
  VALID_FIRST_NAME_KANA = /\A([ァ-ン]|ー)+\z/


  validates :nickname,                presence: {message: "ニックネームを入力して下さい"}, uniqueness: { case_sensitive: false }, length: {maximum: 20}
  validates :email,                   presence: {message: "を正しく入力して下さい"}, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "例) abc@gmail.com" }
  validates :password,                presence: {message: "を正しく入力して下さい"}, length: {minimum: 6, maximum: 30, message: "は6文字以上で設定して下さい"}
  validates :last_name,               presence: {message: "姓を入力して下さい"}, length: {maximum: 20}
  validates :first_name,              presence: {message: "名を入力して下さい"}, length: {maximum: 20}
  validates :last_name_kana,          presence: {message: "姓カナを入力して下さい"}, format: { with: VALID_LAST_NAME_KANA, message: "正しく入力して下さい"}, length: {maximum: 20}
  validates :first_name_kana,         presence: {message: "名カナを入力して下さい"}, format: { with: VALID_FIRST_NAME_KANA, message: "正しく入力して下さい"}, length: {maximum: 20}
  validates :phone_num,               presence: {message: "正しく入力して下さい"}, format: { with: VALID_PHONE, message: "ハイフンなしで入力して下さい"}

end
