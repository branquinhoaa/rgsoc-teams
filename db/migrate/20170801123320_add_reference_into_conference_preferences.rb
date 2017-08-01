class AddReferenceIntoConferencePreferences < ActiveRecord::Migration[5.1]
  def change
    change_table :conference_preferences do |t|
      t.references :first_choice
      t.references :second_choice 
    end
  end
end
