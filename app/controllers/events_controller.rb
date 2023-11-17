class EventsController < ApplicationController
  def index
    @events = Event.upcoming
  end

  def show 
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "#{@event.name} updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "#{@event.name} created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_url, status: :see_other, notice: "#{@event.name} deleted."
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :price, :starts_at, :description, :capacity, :image_file_name)
  end
end