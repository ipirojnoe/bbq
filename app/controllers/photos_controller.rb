class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers(@event, @new_photo)
      redirect_to @event, success: I18n.t('controllers.photos.created')
    else
      render 'events/show', danger: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {success: I18n.t('controllers.photos.destroyed')}

    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = {danger: I18n.t('controllers.photos.error')}
    end

    redirect_to @event, message
  end

  private

  def notify_subscribers(event, photo)
    author_email = photo.user.email
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [author_email]

    all_emails.each do |mail|
      EventMailer.photo(event, photo, mail).deliver_now
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
