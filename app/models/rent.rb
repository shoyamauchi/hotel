class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :hotelapp

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 20 }

  validate :date_cannot_be_in_the_past 
  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "：過去の日付は無効です") 
    end

    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "：過去の日付は無効です") 
    end

    if end_date.present? && end_date < start_date
      errors.add(:end_date, "：終了日は開始日より前に指定はできません")
    end
  end
end

