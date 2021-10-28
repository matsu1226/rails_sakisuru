const PROFILE_MAXIMUM_COUNT = 140;

export default() => {
  console.log("テスト");

  document.addEventListener("turbolinks:load", ()=> {
    user_profile_count();
    console.log("turbolinks:load");
  });

  function user_profile_count(){
    let profile = document.getElementById('profile');
    let profile_now_count = document.getElementById('profile_now_count');

    function btn_disabled() {
      let btn = document.getElementById('user_update_btn');
      if ( profile.value.length == 0 || profile.value.length > PROFILE_MAXIMUM_COUNT) {
        btn.disabled = true;
      } else {
        btn.disabled = false;
      }
    }

    function profile_count() {
      profile_now_count.innerHTML = PROFILE_MAXIMUM_COUNT - profile.value.length;
    } 
    
    if( profile == null  ){
      console.log("profileの文字数カウントは動作していません")
    }　else {      
      profile.addEventListener('input', () => {
        profile_count();
        btn_disabled();
      })
      
    }
  }


}