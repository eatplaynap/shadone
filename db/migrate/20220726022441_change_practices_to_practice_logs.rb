class ChangePracticesToPracticeLogs < ActiveRecord::Migration[6.1]
  def change
    rename_table :practices, :practice_logs
  end
end
