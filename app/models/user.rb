class User
  include Mongoid::Document
  field :email, :type => String
  field :password, :type => Mongoid::EncryptedString
  field :bars, :type => String
end