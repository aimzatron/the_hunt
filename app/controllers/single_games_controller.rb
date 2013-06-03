class SingleGamesController < ApplicationController

  def index
    @single_games = SingleGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @single_games }
    end
  end

  def show
    @single_game = SingleGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @single_game }
    end
  end

  def new
    @single_game = SingleGame.new
  end

  def edit
    @single_game = SingleGame.find(params[:id])
  end

  def create
    @single_game = SingleGame.new(params[:single_game])

    if @single_game.save
      redirect_to single_game_path(@single_game.id), notice: 'A new hunt was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @single_game = SingleGame.find(params[:id])

    respond_to do |format|
      if @single_game.update_attributes(params[:single_game])
        format.html { redirect_to @single_game, notice: 'Single game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @single_game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @single_game = SingleGame.find(params[:id])
    @single_game.destroy

    respond_to do |format|
      format.html { redirect_to single_games_url }
      format.json { head :no_content }
    end
  end
end
