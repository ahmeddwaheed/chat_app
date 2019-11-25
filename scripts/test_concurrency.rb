#!/usr/bin/env ruby

require 'logger'
require 'net/http'
require File.expand_path('../../config/environment', __FILE__)

# chat_db = ActiveRecord::Base.establish_connection(:adapter => "mysql2",
#                                                   :username => "root",
#                                                   :password => "password",
#                                                   :database => "chat_app_development")

logger = Logger.new(STDOUT)

# logger.info('Creating an app...')

# logger.info(App.first)

url = URI.parse("http://localhost:3000/applications/#{App.first.token}/chats/")

logger.info(url)

x = Net::HTTP.get(url)

logger.info(x.body)


# user_handle = ENV['USER_HANDLE']

# def collect_with_max_id(collection=[], max_id=nil, &block)
#   response = yield(max_id)
#   collection += response
#   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
# end

# def client.get_max_tweets(user)
#   collect_with_max_id do |max_id|
#     options = {
#       count: 200,
#       include_rts: true,
#       exclude_replies: true
#     }
#     options[:max_id] = max_id unless max_id.nil?
#     user_timeline(user, options)
#   end
# end

# tweets = client.get_max_tweets(user_handle)