class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
