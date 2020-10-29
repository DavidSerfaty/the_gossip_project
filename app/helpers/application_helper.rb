module ApplicationHelper

  def is_mine(obj, user)
    obj.user == user
  end
end
