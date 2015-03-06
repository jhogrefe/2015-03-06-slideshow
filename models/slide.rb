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
  attr_accessor :slide_order, :title, :body 
  
  def initialize(options)
    @slide_order = options["slide_order"]
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
    DATABASE.execute("INSERT INTO contents (slide_order, title, body) 
                      VALUES (#{@slide_order}, '#{@title}', '#{@body}')")
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
  def edit(params)
    DATABASE.execute("UPDATE contents SET (body = '#{body_to_update}', 
    title = '#{title_to_update}', slide_order = '#{order_to_update}') 
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
  def delete
    binding.pry
    DATABASE.execute("DELETE FROM contents WHERE id = #{id}")
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
  def self.find(id)
     results = DATABASE.execute("SELECT * FROM contents WHERE id = #{id}")[0]
    self.new(results)
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
  
  def save
    attributes = []

    instance_variables.each do |i|
      attributes << i.to_s.delete("@")
    end
  
    query_hash = {}

    attributes.each do |a|
      value = self.send(a)
      query_hash[a] = value
    end
    
    query_hash.each do |key, value|
      DATABASE.execute("UPDATE contents SET #{key} = ? WHERE id = #{@id}", value )
    end
    self
  end
  
  def to_hash
    {
      id: id,
      slide_order: slide_order,
      title: title,
      body: body
    }
  end
  
end