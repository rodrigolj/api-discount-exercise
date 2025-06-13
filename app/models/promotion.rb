class Promotion
  ACTIVE_PROMOTIONS = [:threefortwo, :vipdiscount]
  INACTIVE_PROMOTIONS = []

  def active
    ACTIVE_PROMOTIONS
  end

  def inactive
    INACTIVE_PROMOTIONS
  end
end
