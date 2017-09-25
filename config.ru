require 'pry'
require 'dotenv/load'
require 'facebook/messenger'
require_relative 'bot'
require_relative 'bot/message'

run Facebook::Messenger::Server
