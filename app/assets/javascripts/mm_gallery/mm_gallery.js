MmGallery = {
  artifacts: undefined,
  url: '/mm_gallery/artifacts.json',
  blueprint: '<div class="artifact" data-artifact-id="ID"><img src="SRC" /><span>LABEL</span></div>',
  showPicker: function(a) {
      return function(data) {
        if (data) {
          MmGallery.artifacts = data;
        } else {
          console.log("cache hit");
          data = MmGallery.artifacts;
        }
        var modal = a.siblings("div.modal.artifact-picker");
        var body = modal.find(".modal-body");
        var active_ids = a.parents(".gallery-icons").find('input').val().split(",");
        console.log(active_ids);
        body.html("");
        $.each(data, function(){
          var d = this;
          var s = MmGallery.blueprint;
          s = $(s.replace('ID', d.id).replace('SRC', d.image).replace("LABEL", d.title));
          if (active_ids.indexOf(""+d.id) >= 0) {
            console.log("active: " + d.id);
            s.addClass('selected');
          }
          body.append(s);
        })
        body.find('div.artifact[data-artifact-id]').click(function() {
          var div = $(this);
          if (div.hasClass('selected')) {
            div.removeClass('selected');
          } else {
            div.addClass('selected');
          }
        })
        modal.find('.save-button').click(function(){
          var input = a.parents('.gallery-icons').find('input');
          console.log(input.val());
          var val = body.find('div.artifact.selected[data-artifact-id]').map(function(){
            return $(this).data('artifact-id');
          }).toArray().join(",");
          input.val(val);
          modal.find('.close-button').click();
        });
        modal.modal();
      }
    },
  init: function(sel) {
      jQuery(function($){
        // Attach 'Add' Button
        $(sel).click(function(){
          var a = $(this);
          if (MmGallery.artifacts) {
            MmGallery.showPicker(a)();
          } else {
            $.ajax(MmGallery.url, {
              success: MmGallery.showPicker(a)
            })
          }
          return false;
        });
      }
      // initially create 'visibles'
    )
  }
}

MmGallery.init('div[data-mm-gallery-association] a[data-mm-gallery-association]');
