//= require jquery
//= require jquery_ujs

function openCommentForm(i) {
  document.getElementById(`comment-form-${i}`).classList.toggle("hide");
  document.getElementById(`comment-button-${i}`).classList.toggle("active");
}

function toggleReactionButton(ele_id) {
  document.getElementById(ele_id).classList.toggle("active");
}

// function changeRegion(region) {
//   $("#discussion-selector").html("<%= escape_javascript(render partial: 'discussions/discussions', locals: { discussions: @discussions } ) %>");
// }
