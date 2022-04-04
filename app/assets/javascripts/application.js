function openCommentForm(ele_id) {
    document.getElementById(ele_id).classList.toggle("hide");
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