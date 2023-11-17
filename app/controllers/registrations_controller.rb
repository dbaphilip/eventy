class RegistrationsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @registrations = @event.registrations
  end

  def new
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.new
  end

  def create
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.new(registration_params)

    registrations_count = Registration.current_registrations(@registration.email, @event.id).count

    if registrations_count > 0 
      redirect_to new_event_registration_url(@event), alert: "Duplicate registration!"
    elsif @registration.save
      redirect_to event_registrations_url(@event), notice: "Thanks for registering"
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email, :how_heard)
  end
end

# @event = Event.find(params[:event_id])
# above line should be moved into a 'Callback'