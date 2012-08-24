function MountableGallery(selector) {
  this.selector        = selector;
  this.artifacts       = undefined;
  this.artifacts_by_id = {};
  this.url             = '/mountable_gallery/artifacts.json';
  this.blueprint       = '<div class="artifact" data-artifact-id="ID" data-tag="ATAG"><img src="SRC" /><span>LABEL</span></div>';
  this.activation_link = $(selector);

  if (this.activation_link.length == 0) {
    return false;
  }

  this.modal = function() {
    return this.activation_link.siblings("div.modal.artifact-picker");
  }

  this.input = function() {
    return this.activation_link.parents('.gallery-icons').find('input');
  }

  this.active_ids = function() {
    var selected = this.input().val();
    return selected.length > 0 ? selected.split(",") : [];
  }

  this.artifactView = function(data) {
    var s = this.blueprint;
    s = $(s.replace('ID', data.id).replace('SRC', data.image).replace("LABEL", data.title).replace("ATAG", data.tag));
    return s;
  };

  this.artifactViewForId = function(id) {
    return this.artifactView(this.artifacts_by_id[id])
  };

  this.showPicker = function() {
    var self = this
    return function() {
      data = self.artifacts;
      var modal = self.modal();
      var body = modal.find(".modal-body");
      var active_ids = self.active_ids();
      body.html("");
      $.each(data, function(){
        var d = this;
        var s = self.artifactView(d);
        if (active_ids.indexOf(""+d.id) >= 0) {
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
      sb = modal.find('.save-button')
      sb.unbind("click");
      sb.click(self.save());
      modal.modal();
    }
  };

  this.save = function() {
    var self = this;
    return function() {
      var input = self.input();
      var modal = self.modal();
      var selected = modal.find('div.artifact.selected[data-artifact-id]');
      ids = selected.map(function() {
        var icon = $(this);
        return icon.data('artifact-id');
      }).toArray();
      input.val(ids.join(","));
      modal.find('.close-button').click();
      self.updateIconList();
      return false;
    }
  }

  this.updateIconList = function() {
    var input = this.input();
    var modal = this.modal();
    var list = modal.siblings(".active-artifacts");
    list.html("");
    var selected = this.active_ids();
    var self = this;
    $.each(selected, function(i, id) {
      var icon = self.artifactViewForId(id);
      list.append(icon);
    });
    return false;
  }

  this.acceptArtifactList = function() {
    var self = this;
    return function(data) {
      $.each(data, function(i,v) {
        self.artifacts_by_id[v.id] = v;
      })
      self.artifacts = data;
      self.updateIconList();
      self.activation_link.click(self.showPicker());
    }
  };

  $.ajax(this.url, {
    success: this.acceptArtifactList()
  });
}

$(function($) {
  new MountableGallery('div[data-mm-gallery-association] a[data-mm-gallery-association]');
});

jQuery(function($){
  $('#artifact_search_field').keyup(function(){
    var search = $('#artifact_search_field').val();
    var regex_obj = new RegExp(search, 'g');
    $('div.artifact-picker div.artifact').each(function(i, thing){
      var div = $(thing);
      var tag = div.data('tag');
      if(!search || (tag && tag.match(regex_obj))) 
        div.show();
      else
        div.hide();
    });
  });
});
