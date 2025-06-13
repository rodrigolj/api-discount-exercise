class Customer < ApplicationRecord
  validates: :name, presence: true
  enum kind: {
    common: 0,
    vip: 1
  }
end
