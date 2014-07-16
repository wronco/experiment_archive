class ExperimentsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in

  def index
    @experiments = current_user.experiments.order('optimizely_last_updated_at DESC')
  end

  def edit
    @experiment = current_user.experiments.find(params[:id])
  end

  def update
    @experiment = current_user.experiments.find(params[:id])
    if @experiment.update_attributes(permitted_params(params[:experiment]))
      redirect_to edit_experiment_path(@experiment), notice: "Saved."
    else
      render action: :edit    
    end
  end

  def refresh
    current_user.update_attributes(optimizely_refresh_started_at: Time.now)
    current_user.delay.refresh_from_optimizely
    redirect_to experiments_path, notice: "Optimizely refreshing now. Reload this page in a couple of minutes to see the results."
  end

  private
  def permitted_params(params)
    params.permit(:winner, :confidence, :brief, :hypothesis)
  end
end

