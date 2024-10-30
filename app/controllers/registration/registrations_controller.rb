# frozen_string_literal: true

class Registration::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super

    account = Account.create!
    resource.update!(account_id: account.id)
  end
end
