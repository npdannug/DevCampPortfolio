document.addEventListener('turbolinks:load', () => {
	document.getElementById("post-comment").addEventListener("click", function() {
	  console.log("Hey")
	  const btn = document.getElementById("post-comment")
	  btn.disabled = false
	  console.log("There")
	});
})