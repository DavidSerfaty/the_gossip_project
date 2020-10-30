module ApplicationHelper

  include LikesHelper

  def is_mine(obj, user)
    obj.user == user
  end
end
