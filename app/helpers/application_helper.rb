module ApplicationHelper
  def user_avatar(user)
    'media/images/user.png'
  end

  def flash_class(name)
    case name
    when 'notice' then 'info'
    when 'alert'  then 'danger'
    else name
    end
  end
end
