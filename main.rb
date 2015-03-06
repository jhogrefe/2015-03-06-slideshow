require 'pry'
require 'sinatra'
require 'sqlite3'
require 'json'

DATABASE = SQLite3::Database.new('databases/content.db')

require_relative "databases/database_setup.rb"
require_relative "slide.rb"

get "/" do
  erb :homepage
end

get "/previous-slide" do
  
end

get "/next-slide" do
  
end

get "/edit-slide" do
  
end