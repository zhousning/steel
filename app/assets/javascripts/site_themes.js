$(".site_themes.index").ready(function() {
  addFilterActive();
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
  url = "search=" + conds;
  window.location.search = url; 
}

function addFilterActive() {
  var tags = gon.tags;
  for (var i=0; i<tags.length; i++) {
    var targetNode = $($("#filter-cond-ctn li")[i]).find("a[value='"+tags[i]+"']");
    $(targetNode).addClass("filter-item-active");
  }
}
