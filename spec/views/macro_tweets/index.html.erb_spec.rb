require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/macro_tweets/index.html.erb" do
  include MacroTweetsHelper
  
  before(:each) do
    assigns[:macro_tweets] = [
      stub_model(MacroTweet,
        :body => "value for body"
      ),
      stub_model(MacroTweet,
        :body => "value for body"
      )
    ]
  end

  it "renders a list of macro_tweets" do
    render
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

