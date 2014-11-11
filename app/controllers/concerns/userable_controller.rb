module UserableController
  extend ActiveSupport::Concern

  included do
    around_action :wrap_in_rescue, only: :create
  end

  def user_params
    [:first_name, :last_name, :email]
  end
end
