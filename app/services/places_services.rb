class PlacesServices   
    require 'uri'
    require 'net/http'
    require 'openssl'
   
    search_place = "https://maps.googleapis.com/maps/api/place/findplacefromtext/
                    json?key=AIzaSyCFTlxyldaGG9qH4P6pzLss3xa9rfmO_Rs&input=#{venue.name}&inputtype=textquery&fields=place_id"
    
    
    
    def self.get(request_url)
    #url qui cherche avec le venue.name et renvoi un JSON avec le place_id correspondant
    url = URI(request_url)
    # execution de la requête
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    # response renvoi le JSON a exploiter
    response = http.request(request)
     response.read_body
    end

    #permet de recuperer le place id dans un hash
    place_info = JSON.parse(responce.read_body)
    
    #recuperer le hash et recuperer le place_id
    place_id = place_info["candidates"][0]["place_id"]
    #le stocker dans une variable

    search_information ="https://maps.googleapis.com/maps/api/place/details/
    json?place_id=#{place_id}=rating,opening_hours&key=AIzaSyCFTlxyldaGG9qH4P6pzLss3xa9rfmO_Rs"

    def launch(venue.name, place_id)
        self.get(search_place)
        self.get(search_information)
    end

end