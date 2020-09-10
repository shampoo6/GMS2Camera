// @desc 设置相机的控制器，控制器的event_user0事件，是相机移动结束事件
function gms2CameraSetController(cam, _controller){
	with(cam) {
		controller = _controller;
	}
}