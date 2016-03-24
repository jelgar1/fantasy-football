class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params.merge({:user_id => current_user.id}))
    redirect_to '/teams'
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
