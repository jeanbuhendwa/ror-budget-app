class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :entities

  validates :name, :icon, presence: true

  def total_amount
    entities.sum(:amount)
  end

  def self.total_amount(user)
    joins(:entities).where(author_id: user.id).sum('entities.amount')
  end
end
