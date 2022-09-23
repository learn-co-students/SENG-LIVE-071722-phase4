class UserTicketSerializer < ActiveModel::Serializer
  attributes :price, :production

  def production
    {title: object.production.title}
  end 
end
