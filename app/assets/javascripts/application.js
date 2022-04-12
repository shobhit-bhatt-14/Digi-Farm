//= require jquery
//= require jquery_ujs

global.$ = jQuery;

function openCommentForm(i) {
  document.getElementById(`comment-form-${i}`).classList.toggle("hide");
  document.getElementById(`comment-button-${i}`).classList.toggle("active");
}

function toggleReactionButton(ele_id) {
  document.getElementById(ele_id).classList.toggle("active");
}

function changeRegion(region) {
  $.ajax({
    url: "/discussions",
    type: "post",
    data: { region_id: region },
    success: function (data) {
      $("#let-see").html(data);
      console.log("DONE");
    },
  });
  console.log(region);
}
