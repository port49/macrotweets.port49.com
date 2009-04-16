require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/macro_tweets/edit.html.erb" do
  include MacroTweetsHelper
  
  before(:each) do
    assigns[:macro_tweet] = @macro_tweet = stub_model(MacroTweet,
      :new_record? => false,
      :body => "value for body"
    )
  end

  it "renders the edit macro_tweet form" do
    render
    
    response.should have_tag("form[action=#{macro_tweet_path(@macro_tweet)}][method=post]") do
      with_tag('textarea#macro_tweet_body[name=?]', "macro_tweet[body]")
    end
  end
end


