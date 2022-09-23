class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :production
  has_one :user



end
