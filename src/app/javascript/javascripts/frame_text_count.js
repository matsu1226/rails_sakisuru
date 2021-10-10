const TEXT_MAXIMUM_COUNT = 300;
const STATE_MAXIMUM_COUNT = 70;


export default() => {

  document.addEventListener("turbolinks:load", ()=> {
    frame_text_count();
  });

  function frame_text_count(){
    let text = document.getElementById('frame_text');
    let text_now_count = document.getElementById('text_now_count');

    let state = document.getElementById('frame_statement');
    let state_now_count = document.getElementById('statement_now_count');

    function btn_disabled() {
      let btn = document.getElementById('frame_create_btn');
      if ( text.value.length == 0 || text.value.length > TEXT_MAXIMUM_COUNT ||
          state.value.length == 0 || state.value.length > STATE_MAXIMUM_COUNT) {
        btn.disabled = true;
      } else {
        btn.disabled = false;
      }
    }

    function text_count() {
      text_now_count.innerHTML = TEXT_MAXIMUM_COUNT - text.value.length;
    } 
    function state_count() {
      state_now_count.innerHTML = STATE_MAXIMUM_COUNT - state.value.length;
    } 
    
    if( text == null || state == null ){
      console.log("frameの文字数カウントは動作していません")
    }　else {      
      text.addEventListener('input', () => {
        text_count();
        btn_disabled();
      })
      
      state.addEventListener('input',() => {
        state_count();
        btn_disabled();
      } )
    }
  }


}