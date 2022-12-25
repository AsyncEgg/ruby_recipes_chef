
def food(food_name,ingr='',diet='',health='',cuisine_type='',type='',grab='label')
    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'json'

    app_key = '' #enter your app key
    app_id = '' #enter your app id

    url = URI("https://api.edamam.com/api/recipes/v2?type=public&q=#{food_name}&app_id=#{app_id}&app_key=#{app_key}#{ingr}#{diet}#{health}#{cuisine_type}#{type}&dishType=Soup&calories=100-1000&time=1-120&excluded=peanuts&random=true")
  
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
  
    if response.code == "200"
      result = JSON.parse(response.body)

      puts result['hits'][0]['recipe'][grab]

    else
      puts "ERROR!!!: #{response.code} \n #{response}"
    end
end
  
puts "Enter a food name and add diffrent queiries"
food(food_name='fish',diet='&diet=low-fat')
