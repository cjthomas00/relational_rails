class TeamsController < ApplicationController
  def index
    @teams = Team.all.order_teams
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    team = Team.create!(team_params)

    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])
    team.players.destroy
    team.destroy

    redirect_to '/teams'
  end


private
  def team_params
    params.permit(:name, :city, :original_six_team, :number_of_stanley_cups)
  end
end