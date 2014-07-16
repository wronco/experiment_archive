class OptimizelySetupController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(optimizely_api_key: params[:user][:optimizely_api_key])
      redirect_to edit_optimizely_setup_path, notice: 'Woorrrrddddddd.'
    else
      render :edit
    end
  end


end
