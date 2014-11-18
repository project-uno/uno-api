module UserableController
  extend ActiveSupport::Concern

  included do
    around_action :wrap_in_rescue, only: [ :show, :create, :update, :destroy ]
  end

  def user_params
    [:first_name, :last_name, :email, :school_id]
  end
end
