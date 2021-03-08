module ApplicationHelper
  def user_avatar(user = nil)
    unless user.nil?
      return user.avatar.url if user.avatar?

      asset_pack_path('media/images/default.png')
    else      
      asset_pack_path('media/images/anon.jpg')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_pack_path('media/images/default.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_pack_path('media/images/event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_pack_path('media/images/event_thumb.jpg')
    end
  end

  def flash_class(name)
    case name
    when 'notice' then 'info'
    when 'alert'  then 'danger'
    else name
    end
  end

  def fa_icon(icon_class)
    content_tag 'i', '', class: "#{icon_class}"
  end

  
  def delete_photo?(event, photo)
    if event.user == current_user || photo.user == current_user
      link_to fa_icon("fas fa-trash"), event_photo_path(event, photo), method: :delete
    end
  end
end
