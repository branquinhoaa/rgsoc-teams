class AddAtributesIntoConferencePreference < ActiveRecord::Migration[5.1]
  def change
    add_column :conference_preferences, :comment, :text
    add_column :conference_preferences, :lightning_talk, :boolean, default: false
  end
end
