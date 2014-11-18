module Userable
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :meta, dependent: :destroy

    accepts_nested_attributes_for :user
    delegate :first_name, :last_name, :full_name, :email, :school_id, to: :user
  end
end
