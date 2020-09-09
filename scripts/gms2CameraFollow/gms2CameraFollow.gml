// @desc 跟踪目标
function gms2CameraFollow(cam, _target){
	if (!instance_exists(_target)) return;
	with (cam) {
		if (moving || lerping) return;
		target = _target;
	}
}