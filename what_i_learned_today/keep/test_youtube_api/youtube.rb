# ================
# 公式ドキュメント
# Class: Google::Apis::YoutubeV3::YouTubeService
# https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/YoutubeV3/YouTubeService.html

# google-api-ruby-client
# https://github.com/googleapis/google-api-ruby-client#which-client-should-i-use

# module Google
#     module Apis
#       module YoutubeV3
# https://github.com/googleapis/google-api-ruby-client/blob/main/google-api-client/generated/google/apis/youtube_v3/service.rb
# ================

require 'google/apis/youtube_v3'
# require 'yaml'
# require 'json'
require "pry"

def set_youtube_service
    service = Google::Apis::YoutubeV3::YouTubeService.new
    key = YAML.load_file("./credentials.yml")
    service.key = key["api_key"]
    service
end

# def cat_videos
#     service.key = API_KEY
#     service.list_videos(
#     )
# end

def channels
    youtube = set_youtube_service
    options = {
        :id => 'UCPyNsNSTUtywkekbDdCA_8Q' #YouTubeチャンネルのIDを指定
    }
    # service.list_videos("id,snippet,statistics", max_results: 50, id: "video_id,video_id,...")
    response = youtube.list_channels("snippet", options)
end

def hashed_res
    channels
    hashed_channels = channels.to_h
end

p channels
p channels.class
p hashed_res
p hashed_res.class


