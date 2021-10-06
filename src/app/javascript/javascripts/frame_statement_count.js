const MAXIMUM_COUNT = 70;

export default() => {
  document.addEventListener('DOMContentLoaded', function(){
    let state = document.getElementById('frame_statement');
    let statement_now_count = document.getElementById('statement_now_count');
    
    state.addEventListener('input', () => {
      statement_now_count.innerHTML = MAXIMUM_COUNT - state.value.length;
    })
  },false);

}