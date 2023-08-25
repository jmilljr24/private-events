class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @event = Event.find(params[:event_id])

    enrollment = Enrollment.new(user_id: current_user.id, event_id: @event.id)

    if enrollment.save
      redirect_to @event, notice: 'You are now attending this event.'
    else
      redirect_to @event, alert: 'You are already attending this event.'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    attendee = Enrollment.find_by(user_id: current_user.id, event_id: @event.id)
    attendee.destroy
    redirect_to @event, notice: 'You are no longer attending this event!'
  end
end
