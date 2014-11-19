class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :school_id, :section_name

end
