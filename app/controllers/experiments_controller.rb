class ExperimentsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in

  def index
    @experiments = current_user.experiments.order('optimizely_last_updated_at DESC')
  end

  def edit
    @experiment = current_user.experiments.find(params[:id])
  end

  def refresh
    current_user.delay.refresh_from_optimizely
    redirect_to experiments_path, notice: "Optimizely refreshing now. Reload this page in a couple of minutes to see the results."
  end

end
