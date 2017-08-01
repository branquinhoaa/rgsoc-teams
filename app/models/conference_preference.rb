class ConferencePreference < ActiveRecord::Base

  belongs_to :team, inverse_of: :conference_preference
  belongs_to :first_choice, class_name: 'Conference'
  belongs_to :second_choice, class_name: 'Conference'

end
