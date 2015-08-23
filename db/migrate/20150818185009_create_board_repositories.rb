class CreateBoardRepositories < ActiveRecord::Migration
  def change
    create_table :board_repositories do |t|
      t.string :name
      t.string :slug
      t.boolean :board, array: true, default: []
      t.string :board_type

      t.timestamps
    end
  end
end
