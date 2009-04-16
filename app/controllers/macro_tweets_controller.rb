class MacroTweetsController < ApplicationController
  # GET /macro_tweets
  # GET /macro_tweets.xml
  def index
    @macro_tweets = MacroTweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @macro_tweets }
    end
  end

  # GET /macro_tweets/1
  # GET /macro_tweets/1.xml
  def show
    @macro_tweet = MacroTweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @macro_tweet }
    end
  end

  # GET /macro_tweets/new
  # GET /macro_tweets/new.xml
  def new
    @macro_tweet = MacroTweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @macro_tweet }
    end
  end

  # GET /macro_tweets/1/edit
  def edit
    @macro_tweet = MacroTweet.find(params[:id])
  end

  # POST /macro_tweets
  # POST /macro_tweets.xml
  def create
    @macro_tweet = MacroTweet.new(params[:macro_tweet])

    respond_to do |format|
      if @macro_tweet.save
        flash[:notice] = 'MacroTweet was successfully created.'
        format.html { redirect_to(@macro_tweet) }
        format.xml  { render :xml => @macro_tweet, :status => :created, :location => @macro_tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @macro_tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /macro_tweets/1
  # PUT /macro_tweets/1.xml
  def update
    @macro_tweet = MacroTweet.find(params[:id])

    respond_to do |format|
      if @macro_tweet.update_attributes(params[:macro_tweet])
        flash[:notice] = 'MacroTweet was successfully updated.'
        format.html { redirect_to(@macro_tweet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @macro_tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /macro_tweets/1
  # DELETE /macro_tweets/1.xml
  def destroy
    @macro_tweet = MacroTweet.find(params[:id])
    @macro_tweet.destroy

    respond_to do |format|
      format.html { redirect_to(macro_tweets_url) }
      format.xml  { head :ok }
    end
  end
end
