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

#region 移动相机

if(keyboard_check(ord("M"))){
	gms2CameraStopFollow(obj_Camera);
	//gms2CameraMove(obj_Camera, 300, 133, 64, false);
	gms2CameraMove(obj_Camera, 400, 200, 64, false);
}
if(keyboard_check(ord("L"))){
	gms2CameraStopFollow(obj_Camera);
	//gms2CameraLerp(obj_Camera, 300, 133, 0.02, false);
	gms2CameraLerp(obj_Camera, 400, 200, 0.02, true);
}

#endregion

#region 跟踪目标

if(keyboard_check(ord("F"))){
	gms2CameraFollow(obj_Camera, obj_PlayerToken);
}

#endregion

#region 摇晃

if(keyboard_check(ord("B"))){
	gms2CameraShake(obj_Camera, 16, 3);
}

#endregion