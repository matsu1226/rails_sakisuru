// ユーザー情報にアイコンとプロフィールを追加する方法を丁寧に解説（rails）
// https://qiita.com/naoki00m/items/6430ab0b62766b582c9a 

export default() => {
  $(function(){
    $fileField = $('#upload_image') //変更後の画像
  
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#image_preview"); //変更後の画像表示用の空div
  
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({   // preview内にimgタグの挿入
            src: e.target.result,             // 
            width: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);   // 指定されたFileの内容を読み込む
    });
  });

}
