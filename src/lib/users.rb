class User
    #initialize all objects in User
    def initialize(id, name, username)
        @id = id
        @name = name
        @username = username
    end

    # Get the id of the user
    def getId
        return @id
    end

    #Get all the name object
    def getName
        return @name
    end

    #Get all the username object
    def getUsername
        return @username
    end

  

end