$(".nlps.index").ready(function() {
  $("#nlp-analyze").click(function() {
    var texts = $.trim($("#nlp-post").val());
    $.getJSON("/nlps/analyze", { text: texts}, function(data){
      var items = data.word_count;
      var result = "";
      for (var i=0; i<items.length; i++) {
        result += "<tr><td>" + items[i][0] +"</td><td>" + items[i][1] + "</td></tr>"; 
      }
      $(".nlp-word-frequency").html(result);
    });
  });
})
