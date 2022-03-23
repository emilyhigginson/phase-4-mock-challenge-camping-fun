class ActivitySignupsSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty

  has_many :signups
end
