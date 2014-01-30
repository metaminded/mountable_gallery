class GalleryTabulatrData < Tabulatr::Data
  search :title
  column :id
  column :title
  column :actions do |r|
    [
      link_to("Show", gallery_path(r), id: 'show'),
      link_to("Edit", edit_gallery_path(r), id: 'edit'),
      link_to("Destroy", gallery_path(r), method: 'destroy', id: 'destroy')
    ]
  end
end
