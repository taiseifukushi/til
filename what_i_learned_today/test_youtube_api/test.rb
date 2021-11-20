require 'google/apis/youtube_v3'
require 'yaml'

Youtube = Google::Apis::YoutubeV3 # Alias the module
service = Youtube::YouTubeService.new

key = YAML.load_file("./credentials.yml")
y = key["api_key"]

p y
p y.class
p d
p d.class