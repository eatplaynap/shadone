class RenameMinutesToDurationInPractices < ActiveRecord::Migration[6.1]
  def change
    rename_column(:practices, :minutes, :duration)
  end
end
