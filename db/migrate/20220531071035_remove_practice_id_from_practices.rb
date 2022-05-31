class RemovePracticeIdFromPractices < ActiveRecord::Migration[6.1]
  def change
    remove_columns :practices, :practice_id
  end
end
