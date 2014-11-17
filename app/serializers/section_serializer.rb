class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :created_at, :updated_at
end
