class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def new
  end

  def create
    tag = params[:hashtag]
    @start_time = Date.parse params[:start_time]
    @end_time = Date.parse params[:end_time]

    request = Typhoeus::Request.new(
      "https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=665873981.1677ed0.93c4fb47532944059a0d132ab74646fb"
    )

    response = request.run
    @result = JSON.parse(response.response_body)
    @dataArr = @result["data"]

    @dataArr.each do |data|
      @curTime = data["caption"]["created_time"]
      if Time.at(@curTime.to_i).to_date <= @start_time && Time.at(@curTime.to_i).to_date <= @end_time
        #store in the database
        if data["type"]==="image"
          collection_params = {:username => data["user"]["username"], :link => data["link"], :created_time => @curTime, :image => data["images"]["thumbnail"]["url"], :video => nil }
        else
          collection_params = {:username => data["user"]["username"], :link => data["link"], :created_time => @curTime, :image => nil, :video => data["videos"]["low_bandwidth"]["url"] }
        end
        Collection.create collection_params
        collection_params = {}
      end 
    end

    redirect_to collections_path
  end

end
