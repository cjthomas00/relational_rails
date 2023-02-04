class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    team = Team.create(name: params[:name], city: params[:city], original_six_team: params[:Original_Six_Team], number_of_stanley_cups: params[:Stanley_Cups])

    redirect_to "/teams/#{team.id}"
  end
end