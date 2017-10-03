$(".softwares.new, .softwares.edit").ready(function() {
  var K = window.KindEditor;
  var options = {
    width:'100%',
    height:500,
    allowFileManager : true,
    uploadJson : "/kindeditor/upload",
    fileManagerJson : "/kindeditor/filemanager"
    //themeType : 'editor',
  };
  var kindeditor = K.create("#software-install", options);
});
