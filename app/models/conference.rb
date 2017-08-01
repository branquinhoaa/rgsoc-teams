require 'csv'
class Conference < ActiveRecord::Base
  REGION_LIST = [
    "Africa",
    "South America",
    "North America",
    "Europe",
    "Asia Pacific"
  ]

  include HasSeason

  has_many :preferences_first_choices, :class_name => 'ConferencePreference', :foreign_key => 'first_choice_id', dependent: :destroy
  has_many :preferences_second_choices, :class_name => 'ConferencePreference', :foreign_key => 'second_choice_id', dependent: :destroy


  has_many :attendees, through: :preferences_first_choices, source: :team
  has_many :attendees, through: :preferences_second_choices, source: :team

  validates :name, :url, :city, :country, :region, presence: true

  validate :chronological_dates, if: proc { |conf| conf.starts_on && conf.ends_on }

  scope :ordered, ->(sort = {}) { order([sort[:order] || 'starts_on, name', sort[:direction] || 'asc'].join(' ')) }
  scope :in_current_season, -> { where(season: Season.current) }

  def date_range
    @date_range ||= DateRange.new(start_date: starts_on, end_date: ends_on)
  end

  def chronological_dates
    unless starts_on <= ends_on
      errors.add(:ends_on, 'must be a later date than start date')
    end
  end

  def tickets_left
    confirmed_attendances = conference_preference.select { |conference_preference| conference_preference.confirmed }
    tickets.to_i - confirmed_attendances.size
  end
end
