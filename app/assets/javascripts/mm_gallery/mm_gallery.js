jQuery(function($){
  $('div[data-mm-gallery-association] a[data-mm-gallery-association]').click(function(){
    var a = $(this);
    var obj = a.data('mm-gallery-association');
    $.ajax('/mm_gallery/artifacts.json', {
      data: {object: obj},
      success: showPicker(a)
    })
    return false;
  });

  function showPicker(a) {
    return function(data) {
      var modal = a.siblings("div.modal.artifact-picker");
      var body = modal.find(".modal-body");
      body.html("");
      $.each(data, function(){
        var d = this;
        var s = '<div class="artifact" data-artifact-id="ID"><img src="SRC" /><span>LABEL</span></div>';
        s = s.replace('ID', d.id).replace('SRC', d.image).replace("LABEL", d.title);
        body.append(s);
      })
      modal.modal();
      body.find('div.artifact[data-artifact-id]').click(function() {
        var div = $(this);
        if (div.hasClass('selected')) {
          div.removeClass('selected');
        } else {
          div.addClass('selected');
        }
      })
    }
  }
});
