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
end
