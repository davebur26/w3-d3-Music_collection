require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Beetles'})
artist2 = Artist.new({'name' => 'Eagles'})
artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Beetles 1st album',
  'genre' => 'rock n roll'
})
album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Beetles 2nd album',
  'genre' => 'rock n roll'
})
album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Eagles 1st album',
  'genre' => 'rock'
})
album4 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Eagles 2nd album',
  'genre' => 'rock'
})

album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil
