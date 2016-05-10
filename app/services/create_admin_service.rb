# frozen_string_literal: true

# Seed service to create site admin
class CreateAdminService

  def call
    User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
    end
  end

end
