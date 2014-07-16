class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def after_sign_in_path_for(resource)
    experiments_path
  end
end
