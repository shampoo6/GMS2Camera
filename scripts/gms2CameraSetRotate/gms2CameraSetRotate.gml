///@description Rotates the camera
///@param {id} cam An obj_Camera instance
///@param {real} angle The rotation in degrees
function gms2CameraSetRotate(cam, angle){
	with(cam){
		cam_rot = angle;
		var rads = degtorad(cam_rot + 90); //add 90deg so that rotation 0 equals facing up
		cam_up_x = cos(rads);
		cam_up_y = sin(rads);
		must_update_view = true;
	}
}