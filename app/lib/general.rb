class General
    #Adds a 0 to start of number if under 10
    def self.format(num)
        if (num < 10)
            return "0#{num}"
        else
            return num
        end
    end
end