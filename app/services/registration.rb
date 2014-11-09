class Registration

  def initialize(user_params)
    @user_attributes = {user_attributes: user_params}
  end

  def create_teacher!
    Teacher.create! @user_attributes
  end

  def create_student!
    Student.create! @user_attributes
  end
end
