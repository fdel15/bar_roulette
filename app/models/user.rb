class User
  include Mongoid::Document
  field :email, :type => String
  field :password, :type => String
  field :bars, :type => String
end