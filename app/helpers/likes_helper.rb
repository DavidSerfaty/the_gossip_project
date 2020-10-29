module LikesHelper


  def already_liked?(user, gossip)
    Like.where(user_id: user.id, gossip_id: gossip.id).exists?
  end

  def get_like(user, gossip)
    Like.find_by(user_id: user.id, gossip_id: gossip.id)
  end

end
