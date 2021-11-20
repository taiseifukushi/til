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
require 'yaml'

Youtube = Google::Apis::YoutubeV3 # Alias the module
service = Youtube::YouTubeService.new

key = YAML.load_file("./credentials.yml")
service.key = key["api_key"]

# def cat_videos
#     service.key = API_KEY
#     service.list_videos(
#     )
# end

options = {
    :id => 'UCPyNsNSTUtywkekbDdCA_8Q' #YouTubeチャンネルのIDを指定
}

# service.list_videos("id,snippet,statistics", max_results: 50, id: "video_id,video_id,...")
response = service.list_channels("snippet", options)

p service
p response
p response.class



