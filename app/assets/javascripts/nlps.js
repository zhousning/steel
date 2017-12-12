$(".nlps.index").ready(function() {
  $("#nlp-analyze").click(function() {
    var texts = $.trim($("#nlp-post").val());
    $.getJSON("/nlps/analyze", { text: texts}, function(data){
      var items = data.word_count;
      var result = "";
      for (var i=0; i<items.length; i++) {
        result += items[i][0] + items[i][1]; 
      }
      $(".nlp-word-frequency").html(result);
    });
  });
})
