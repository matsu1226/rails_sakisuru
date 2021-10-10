// https://qiita.com/fumikao/items/77ffdffc24a9a814fad7

export default() => {
  $(document).on('turbolinks:load', function() { 
    $(".tag_card").draggable();
    $("#area_num_1").droppable({
      accept: ".tag_card",
      tolerance: "intersect",
      drop: function( e, ui ) {
        // const frame_id = $("#frame_id").val();
        let item = ui.draggable
        let item_data = item.data();

        $.ajax({
          type: 'PATCH',
          url: item_data.updateUrl,
          data: {
            area_num: 1
          }
        })

      }
    });

    $("#area_num_2").droppable({
      accept: ".tag_card",
      tolerance: "intersect",
      drop: function( e, ui ) {
        // const frame_id = $("#frame_id").val();
        let item = ui.draggable
        let item_data = item.data();

        $.ajax({
          type: 'PATCH',
          url: item_data.updateUrl,
          data: {
            area_num: 2
          }
        })
      }
    });

    $("#area_num_3").droppable({
      accept: ".tag_card",
      tolerance: "intersect",
      drop: function( e, ui ) {
        let item = ui.draggable
        let item_data = item.data();

        $.ajax({
          type: 'PATCH',
          url: item_data.updateUrl,
          data: {
            area_num: 3
          }
        })
      }
    });

    $("#area_num_4").droppable({
      accept: ".tag_card",
      tolerance: "intersect",
      drop: function( e, ui ) {
        let item = ui.draggable
        let item_data = item.data();

        $.ajax({
          type: 'PATCH',
          url: item_data.updateUrl,
          data: {
            area_num: 4
          }
        })
      }
    });

  });
}  
