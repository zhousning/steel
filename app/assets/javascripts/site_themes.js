$(".site_themes.index .site_themes.filter .site_themes.search").ready(function() {
  addFilterActive();
  addSearchParam();
  $(".filter-cond-item").click(function(e) {
    getSiteThemes(e.target);
  });
});

function getSiteThemes(target) {
  var conds = new Array();
  var url = "";
  $("#filter-cond-ctn li").each(function() {
    var targetNode = $(this).find(target);
    if (targetNode.length != 0) {
      conds.push($(target).attr("value"));
    } else { 
      var active = $(this).find(".filter-item-active");
      conds.push($(active).attr("value"));
    }
  });
  url = "/site_themes/filter?tags=" + conds;
  window.location = url;
}

function addFilterActive() {
  var tags = gon.tags;
  if (tags.length == 0) {
    $("#filter-cond-ctn li").find("a[value='all']").addClass("filter-item-active");
  } else {
    for (var i=0; i<tags.length; i++) {
      var targetNode = $($("#filter-cond-ctn li")[i]).find("a[value='"+tags[i]+"']");
      $(targetNode).addClass("filter-item-active");
    }
  }
}

function addSearchParam() {
  $(".search-blank-text").val(gon.search);
}
