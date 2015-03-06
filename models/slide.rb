# Public: Slide
# A class to get and insert, save and delete new records in the 'contents'
# table of the database.
#
# Attributes:
# @id, @order, @title, @body
#
# Methods:
# #insert, #edit, #delete, #.find (class method), #.all (class method)
class Slide
  
  attr_reader :id
  attr_accessor :order, :title, :body 
  
  def initialize(options)
    @order = options["order"]
    @title = options["title"]
    @body = options["body"]
    @id = options["id"]
  end
  
  # Public: #insert
  # Adds the new slideshow content to the 'contents' table as a new record and 
  # assigns an id.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Inserts values into 'contents' table in the database as a new 
  # content record.
  def insert    
    DATABASE.execute("INSERT INTO contents (order, title, body) 
                      VALUES (#{order}, #{title}, '#{body}')")
    @id = DATABASE.last_insert_row_id
  end
  
  # Public: #edit
  # Updates the values in the 'contents' table.
  #
  # Parameters:
  # body_to_update         - String, new body text for slideshow content record.
  # order_to_update        - Integer, number value for order of slideshow
  #                          content.
  # title_to_update        - String, new title text for slideshow content
  #                          record.
  # id_content             - Integer, ID of translation record to update.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Saves new values in 'contents' table in the database.
  def edit(body_to_update, title_to_update, order_to_update, id_content)
    DATABASE.execute("UPDATE contents SET (body = '#{body_to_update}', 
    title = '#{title_to_update}', order = '#{order_to_update}') 
    WHERE id = '#{id_content}'")        
  end

  # Public: #delete
  # Gets the id value and deletes the content record matching the id.
  #
  # Parameters:
  # id_to_delete - Integer, ID of content to delete.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Removes the content record from the database.   
  def delete(id_to_delete)
    DATABASE.execute("DELETE FROM contents WHERE id = '#{id_to_delete}'")
  end  

  # Public: .find
  # Class method that returns all records in the table
  #
  # Parameters:
  # None.
  #
  # Returns:
  # All table records as objects.
  #
  # State Changes:
  # None.
  def self.find(term_id)
     results = DATABASE.execute("SELECT * FROM contents WHERE term_id = #{term_id}")
     results_as_objects = []
     results.each do |r|
       results_as_objects << self.new(r)
     end
     results_as_objects
  end
  
  # Public: .all
  # Class method that returns all records in the table
  #
  # Parameters:
  # None.
  #
  # Returns:
  # All table records as objects.
  #
  # State Changes:
  # None.  
  def self.all   
     results = DATABASE.execute("SELECT * FROM contents")   
     results_as_objects = []   
     results.each do |r|
       results_as_objects << self.new(r)
     end  
     results_as_objects
  end
  
end