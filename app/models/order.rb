class Order < ApplicationRecord
  belongs_to :user
  enum status: [:done, :not]
end
