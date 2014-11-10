module UserableController
  extend ActiveSupport::Concern

  included do
    around_action :wrap_in_rescue, only: :register
  end

  def user_params
    params.permit(:first_name, :last_name, :email)
  end

end
