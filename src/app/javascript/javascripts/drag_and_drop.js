// ドラッグ&ドロップで並び替え https://qiita.com/fumikao/items/77ffdffc24a9a814fad7
// jQueryUIまとめ的サイト http://alphasis.info/2011/06/jquery-ui-draggable-containment/
// 範囲をarea内に
// 範囲外に出たら元に戻る
// 2度作動するようにする


export default() => {
  // 初回ロード時に動作
  $(document).on('turbolinks:load', function() { 
    drag_and_drop()
  });
  
  // Ajax完了時に動作
  $(document).ajaxStop(function() {
    drag_and_drop()
  })

  // 処理内容
  function drag_and_drop() {
    $(".tag_card").draggable({
      containment: '#tags_area_wrapper',
      scroll: false,
      revert: "invalid",    // dropがacceptされなかった時だけdraggable要素を元の位置に戻す
      revertDuration: 200
    });
  
    for(let num = 1; num <= 4; num++ ) {
      let droppable_area_num_id = `#area_num_${num}`;
      let draggable_area_num_class = `area_num_${num}`;
            
      $(droppable_area_num_id).droppable({
        accept: function(item) {  // 元々属していたのとは異なるdroppable要素にdoropされた時だけ作動
          if(item.hasClass("tag_card") && !item.hasClass(draggable_area_num_class)) {
            return true;
          }
        },
        tolerance: "intersect",   // droppable要素がdraggable要素に半分以上重なったらdrop以下の処理
        drop: function( e, ui ) {
          // const frame_id = $("#frame_id").val();
          let item = ui.draggable
          let item_data = item.data();
          
          $.ajax({
            type: 'PATCH',
            url: item_data.updateUrl,
            data: {
              area_num: num
            }
          })
          
        }
      });
    }
  }

}  
