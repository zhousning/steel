$(".trains.index").ready(function() {
  $("#keywords-rank").click(function() {
    $.getJSON("/trains/get_ranks", function(data) {
      var str = "";
      for (var key in data) {
        str += "<tr><td>" + key + "</td><td>" + data[key] + "</td></tr>" 
      }
      $("#ranks-ctn").html(str);
    });
  });
})
