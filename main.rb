require 'sinatra'
require 'sqlite3'
require 'json'
require 'pry'

DATABASE = SQLite3::Database.new('databases/content.db')

require_relative "databases/database_setup.rb"
require_relative "models/slide.rb"

get "/" do
  erb :homepage
end

get "/previous-slide" do
  
end

get "/next-slide" do
  
end

post "/edit-slide" do
  edit_slide = Slide.find(params[:id])
  edit_slide.edit({"slide_order" => params[:slide_order], "title" => params[:title], 
    "body" => params[:body]}).save
  edit_slide.to_hash.to_json
end

post "/insert-slide" do
  insert_slide = Slide.new(params)
  insert_slide.insert
  insert_slide.to_hash.to_json
end

post "/delete-slide" do
  delete_slide = Slide.find(params["id"])
  delete_slide.delete
  delete_slide.to_hash.to_json
end
