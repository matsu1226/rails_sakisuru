const REVIEW_MAXIMUM_COUNT = 300;

export default() => {
  console.log("テスト");

  document.addEventListener("turbolinks:load", ()=> {
    frame_review_count();
    console.log("frame_review_count / turbolinks:load");
  });

  function frame_review_count(){
    let review = document.getElementById('frame_review');
    let review_now_count = document.getElementById('review_now_count');

    function btn_disabled() {
      let btn = document.getElementById('user_update_btn');
      if ( review.value.length == 0 || review.value.length > REVIEW_MAXIMUM_COUNT) {
        btn.disabled = true;
      } else {
        btn.disabled = false;
      }
    }

    function review_count() {
      review_now_count.innerHTML = REVIEW_MAXIMUM_COUNT - review.value.length;
    } 
    
    if( review == null  ){
      console.log("reviewの文字数カウントは動作していません")
    }　else {      
      review.addEventListener('input', () => {
        review_count();
        btn_disabled();
      })
      
    }
  }


}