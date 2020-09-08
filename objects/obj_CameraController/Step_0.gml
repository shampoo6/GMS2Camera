#region rotate camera based on keys Q/E

var rotate_speed = 1;
var cam_rot = obj_Camera.cam_rot;
if(keyboard_check(ord("Q"))){
	cam_rot += rotate_speed;
	gms2CameraSetRotate(obj_Camera, cam_rot);
}
if(keyboard_check(ord("E"))){
	cam_rot -= rotate_speed;
	gms2CameraSetRotate(obj_Camera, cam_rot);
}

#endregion

#region zoom in/out base on keys Z/C

var max_zoom = 5;
var min_zoom = 0.2;
var zoom_speed = 0.01;
var zoom = obj_Camera.cam_zoom
if(keyboard_check(ord("Z"))){
	zoom = clamp(zoom + zoom_speed, min_zoom, max_zoom);
	gms2CameraSetZoom(obj_Camera, zoom);
}
if(keyboard_check(ord("C"))){
	zoom = clamp(zoom - zoom_speed, min_zoom, max_zoom);
	gms2CameraSetZoom(obj_Camera, zoom);
}

#endregion
