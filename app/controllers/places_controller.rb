class PlacesController < ApplicationController
  def index
    @places = Place.all

    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end

  def show
    @json = Place.all.to_gmaps4rails do |user, marker|
        marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user})
        marker.picture({
                        :picture => "http://www.blankdots.com/img/github-32x32.png",
                        :width   => 32,
                        :height  => 32
                       })
        marker.title   "Your Hunt"
        marker.sidebar "i'm the sidebar"
        marker.json({ :user_id => current_user.uid, :foo => "bar" })
    end
  end

  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
end
