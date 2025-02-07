class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 4 }
    validates :password_confirmation, presence: true



end
