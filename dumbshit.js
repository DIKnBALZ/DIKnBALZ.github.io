function createVideo(name) {
	const video = document.createElement("video");
	const buttonn = document.createElement("button");
	const buttonn2 = document.createElement("button");
	// const volumeShit = document.getElementById("volumeRange");
	video.width = 640;
	video.height = 360;
	video.autoplay = true;
	video.loop = true;
	video.muted = true;
	video.src = "videos/" + name + ".mp4";
	document.body.appendChild(video);

	for (let i = 0; i < 2; i++) {
		var br = document.createElement("br");
		document.body.appendChild(br);
	}

	buttonn.textContent = "pause";
	buttonn2.textContent = "unmute";
	document.body.appendChild(buttonn);
	document.body.appendChild(buttonn2);

	buttonn2.addEventListener("click", function() {
		video.muted = !video.muted;
		buttonn2.textContent = video.muted ? "unmute" : "mute";
	});
	buttonn.addEventListener("click", function() {
		if (video.paused) {
			video.play();
			video.style.filter = "brightness(100%)";
			buttonn.textContent = "pause";
		}
		else {
			video.pause();
			video.style.filter = "brightness(50%)";
			buttonn.textContent = "play";
		}
	});
}