%w{Image Picture Graphic LoremIpsum}.each do |name|
  (1..14).each do |i|
    puts "Creating #{name} #{i}"
    MmGallery::ImageArtifact.create!(
      title: "#{name} #{i}",
      sid: "#{name.parameterize}#{i}",
      file: File.new(File.join(File.dirname(__FILE__), 'images', "#{i}.png"))
    )
  end
end
