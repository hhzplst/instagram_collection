class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def new
  end

  def create
    @data = []
    tag = params[:hashtag]
    start_time = params[:start_time]
    end_time = params[:end_time]

    request = Typhoeus::Request.new(
      "https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=665873981.1677ed0.93c4fb47532944059a0d132ab74646fb"
    )

    response = request.run
    dataArray = JSON.parse(response.response_body.data)

    dataArray.each |data| do
      if data.caption.created_time > start_time && data.caption.created_time < end_time
        @data << data
      end
    end
    pry
  end

end
