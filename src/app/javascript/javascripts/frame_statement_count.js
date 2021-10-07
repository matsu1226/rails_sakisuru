const MAXIMUM_COUNT = 70;

export default() => {

  function frame_statement_count(){
    let state = document.getElementById('frame_statement');
    let statement_now_count = document.getElementById('statement_now_count');

    if (state == null) {
      console.log("frame.statementの文字数カウントは動作していません")
    } else {
      state.addEventListener('input', () => {
        statement_now_count.innerHTML = MAXIMUM_COUNT - state.value.length;
      })
    }
  }

  document.addEventListener('DOMContentLoaded', frame_statement_count);

}