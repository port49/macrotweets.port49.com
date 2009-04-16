require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/macro_tweets/new.html.erb" do
  include MacroTweetsHelper
  
  before(:each) do
    assigns[:macro_tweet] = stub_model(MacroTweet,
      :new_record? => true,
      :body => "value for body"
    )
  end

  it "renders new macro_tweet form" do
    render
    
    response.should have_tag("form[action=?][method=post]", macro_tweets_path) do
      with_tag("textarea#macro_tweet_body[name=?]", "macro_tweet[body]")
    end
  end
end


