function openCommentForm(i) {
    document.getElementById(`comment-form-${i}`).classList.toggle("hide");
    document.getElementById(`comment-button-${i}`).classList.toggle("active");
}

function toggleReactionButton(ele_id) {
    document.getElementById(ele_id).classList.toggle("active");
}

var x = document.getElementById("discussion-region-selector");
x.onchange = changeLocation;
function changeLocation(event) {
    event.target.value;
    console.log(event);
}