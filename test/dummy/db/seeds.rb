(1..14).each do |i|
  MmGallery::ImageArtifact.create!(
    title: "Image #{i}",
    sid: "image#{i}",
    file: File.new(File.join(File.dirname(__FILE__), 'images', "#{i}.png"))
  )
end
