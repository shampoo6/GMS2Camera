// @desc 设置相机位置
// @param camera 相机
// @param _x
// @param _y
function gms2CameraSetPosition(camera, _x, _y){
	with(camera){
		x = _x;
		y = _y;
		must_update_view = true;
	}
}
