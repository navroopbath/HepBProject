class EventsController < ApplicationController

  def show
    @events = Event.all
    @event = Event.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create!(params[:event])
  end

  def update
    @event.update_attributes(event_params)
  end

  def destroy
    @event.destroy
  end

#   def create
#     @event = Event.create!(params[:event])
#     flash[:notice] = "You have signed up with username: #{@event.name}"
#     # redirect_to 'not_sure'
#   end

#   def edit
#     @event = Event.find(params[:id])
#   end

#   def new
#     # ender new view
#   end

#   def update
#     @event = Event.find(params[:id])
#     @event.update_attributes!(params[:event])
#     flash[:notice] = "Event #{@event.name} was successfully updated"
#     # redirect_to 'not sure'
#   end

#   def destroy
#     @event = Event.find(params[:id])
#     @event.destroy
#     flash[:notice] = "event #{@event.name} was destroyed"
#     # redirect_to 'not sure'
#   end
end