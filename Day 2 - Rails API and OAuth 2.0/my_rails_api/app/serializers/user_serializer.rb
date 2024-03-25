class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :bio
end
