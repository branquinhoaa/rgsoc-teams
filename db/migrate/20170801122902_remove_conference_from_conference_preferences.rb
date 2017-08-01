class RemoveConferenceFromConferencePreferences < ActiveRecord::Migration[5.1]
  def change
    remove_reference :conference_preferences, :conference, foreign_key: true
  end
end
