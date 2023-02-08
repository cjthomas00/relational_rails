class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    if params[:alphabetize] == "true"
      @players = Player.where(team_id: @team[:id]).order(:name)
    elsif params[:jersey_number].present?
      @players = Player.where(team_id: @team[:id]).filter_jersey(params[:jersey_number])
    else
      @players = @team.players
    end
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    team = Team.find(params[:team_id])
    player = Player.create!(player_params)
    player.save

    redirect_to "/teams/#{team.id}/players"
  end


  private
  def player_params
    params.permit(:name, :jersey_number, :retired, :team_id)
  end
end