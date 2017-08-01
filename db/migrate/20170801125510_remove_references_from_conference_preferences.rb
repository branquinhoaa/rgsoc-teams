class RemoveReferencesFromConferencePreferences < ActiveRecord::Migration[5.1]
   def up
    remove_reference :conference_preferences, :team, index: true
  end

  def down
    add_reference :conference_preferences, :team, index: true
  end
end
