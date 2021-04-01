class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, except: %i[index new create]

  after_action :verify_authorized, only: %i[edit update destroy show create]
  after_action :verify_policy_scoped, only: [:index]

  def index
    @events = policy_scope(Event)
  end

  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    unless pincode_check(@event)
      flash.now[:danger] = I18n.t('controllers.events.wrong_pincode') if params[:pincode].present?
      render 'password_form'
      return
    end

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)
    authorize @event

    if @event.save
      redirect_to @event, success: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, success: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, success: I18n.t('controllers.events.destroyed')
  end

  private

  def pincode_check(event)
    authorize event
  rescue Pundit::NotAuthorizedError
    false
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :datetime, :description, :address, :pincode)
  end
end
