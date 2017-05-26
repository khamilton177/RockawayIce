class AddSurveyColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :flavors, :svy_vote, :integer
  end
end
