module ApplicationHelper
  def user_avatar(user = nil)
    unless user.nil?
      return user.avatar.url if user.avatar?

      asset_pack_path('media/images/default.png')
    else      
      asset_pack_path('media/images/anon.jpg')
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
end
