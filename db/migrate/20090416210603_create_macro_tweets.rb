class CreateMacroTweets < ActiveRecord::Migration
  def self.up
    create_table :macro_tweets do |t|
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :macro_tweets
  end
end
