///@description sets the camera zoom
///@param {id} cam An obj_Camera instance
///@param {real} zoom The zoom amount
function gms2CameraSetZoom(cam, zoom){
	with(cam){
		cam_zoom = zoom;
		must_update_proj = true;
	}
}