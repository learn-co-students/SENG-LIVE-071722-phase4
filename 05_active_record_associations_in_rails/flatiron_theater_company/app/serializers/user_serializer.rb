class UserSerializer < ActiveModel::Serializer
  attributes :name

  has_many :tickets, serializer: UserTicketSerializer
  has_many :productions
end
