class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { :minimum => 6}

    has_many :projects
    has_many :goals, through: :projects
end
