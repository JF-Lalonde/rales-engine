class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
     object.to_s.insert(-3, ".")
  end
end
