require 'http'
require 'json'
require 'pry'


JSON.parse(File.read('blb.json')).each do |card|
  path = 'images/' + card['name']
  FileUtils.mkdir_p(path)

  Dir.chdir(path) do
    uri = card['image_uris']['normal']
    image = HTTP.get(uri)

    uri = URI.parse(uri)
    path = File.basename(uri.path)

    File.open('image.jpg', 'w') do |f|
      f.write(image.body)
    end
  end
end
