class Division < ApplicationRecord
  has_many :users, dependent: :nullify
end
