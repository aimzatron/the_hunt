class SingleGamesController < ApplicationController
  # GET /single_games
  # GET /single_games.json
  def index
    @single_games = SingleGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @single_games }
    end
  end

  # GET /single_games/1
  # GET /single_games/1.json
  def show
    @single_game = SingleGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @single_game }
    end
  end

  # GET /single_games/new
  # GET /single_games/new.json
  def new
    @single_game = SingleGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @single_game }
    end
  end

  # GET /single_games/1/edit
  def edit
    @single_game = SingleGame.find(params[:id])
  end

  # POST /single_games
  # POST /single_games.json
  def create
    @single_game = SingleGame.new(params[:single_game])

    respond_to do |format|
      if @single_game.save
        format.html { redirect_to @single_game, notice: 'Single game was successfully created.' }
        format.json { render json: @single_game, status: :created, location: @single_game }
      else
        format.html { render action: "new" }
        format.json { render json: @single_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /single_games/1
  # PUT /single_games/1.json
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

  # DELETE /single_games/1
  # DELETE /single_games/1.json
  def destroy
    @single_game = SingleGame.find(params[:id])
    @single_game.destroy

    respond_to do |format|
      format.html { redirect_to single_games_url }
      format.json { head :no_content }
    end
  end
end
