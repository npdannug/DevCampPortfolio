import Typed from "./typed"

document.addEventListener('turbolinks:load', () => {
	var typed = new Typed('.element', {
  		strings: ["Software development should not be a secret process, when I take on a new project I make it my goal to not only deliver a well crafted product but also to ensure that each stage of the process is fully communicated.", "Feel free to check out my blog and portfolio section."],
    	typeSpeed: 20
	});
})