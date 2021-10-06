const MAXIMUM_COUNT = 300;

export default() => {
  document.addEventListener('DOMContentLoaded', function(){
    let text = document.getElementById('frame_text');
    let text_now_count = document.getElementById('text_now_count');
    
    text.addEventListener('input', () => {
      text_now_count.innerHTML = MAXIMUM_COUNT - text.value.length;
    })
  },false);

}