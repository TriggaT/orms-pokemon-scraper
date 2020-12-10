require "pry"



class Pokemon

    attr_accessor :name, :type 
    attr_reader :id, :db 

    
    def initialize (name:, type:, id: nil, db: )
        @name = name 
        @type = type 
        @id = id 
        @db = db 
    end 


    

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) 
          VALUES (?, ?);
        SQL
        
        db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = <<-SQL
        SELECT * 
        FROM pokemon
        WHERE pokemon.id = ?
        SQL
        
        pokemon = db.execute(sql, id).flatten
        Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
        # Pokemon.new(id, pokemon[1], pokemon[2], db)
       
    end






   



end
