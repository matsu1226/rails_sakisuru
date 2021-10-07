const MAXIMUM_COUNT = 300;

export default() => {

  function frame_text_count(){
    let text = document.getElementById('frame_text');
    let text_now_count = document.getElementById('text_now_count');
    
    if( text == null ){
      console.log("frame.textの文字数カウントは動作していません")
    }　else {      
      text.addEventListener('input', () => {
        text_now_count.innerHTML = MAXIMUM_COUNT - text.value.length;
      })
    }
  }

  document.addEventListener('DOMContentLoaded', frame_text_count);

}