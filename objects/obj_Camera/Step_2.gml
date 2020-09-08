/// @description 相机移动，缩放，旋转
//if (instance_exists(target)) {
//	var cameraX = target.x - viewWidth * 0.5;
//	var cameraY = target.y - viewHeight * 0.5;
//	// 通过边框bound算极限位置
//	if (instance_exists(bound)) {
//		var minX = bound.x;
//		var maxX = bound.x + bound.sprite_width - viewWidth;
//		var minY = bound.y;
//		var maxY = bound.y + bound.sprite_height - viewHeight;
	
//		cameraX = clamp(cameraX, minX, maxX);
//		cameraY = clamp(cameraY, minY, maxY);
//	}
	
//	cameraX = lerp(camera_get_view_x(mainCamera), cameraX, followLerpSpeed);
//	cameraY = lerp(camera_get_view_y(mainCamera), cameraY, followLerpSpeed);
	
//    camera_set_view_pos(mainCamera, cameraX, cameraY);
//}
//else if (moving) {
//	var cameraX = camera_get_view_x(mainCamera);
//	var cameraY = camera_get_view_y(mainCamera);
//	var ratio = abs(cameraX - expectX) / abs(cameraY - expectY);
//	var xspeed = ratio * moveSpeed * delta_time * 0.000001;
//	var yspeed = moveSpeed * delta_time * 0.000001 / ratio;
//	var dir = sign(expectX - cameraX);
//	cameraX = cameraX + dir * xspeed;
//	cameraX = abs(cameraX - expectX) < deadzone? expectX: cameraX;
//	dir = sign(expectY - cameraY);
//	cameraY = cameraY + dir * yspeed;
//	cameraY = abs(cameraY - expectY) < deadzone? expectY: cameraY;
//	camera_set_view_pos(mainCamera, cameraX, cameraY);
//	if(cameraX == expectX && cameraY == expectY) {
//		moving = false;
//		// todo 发送移动结束事件
//	}
//}
//else if (lerping) {

//}

if(must_update_proj){
	var _inv_zoom = 0;
	if(cam_zoom < 0){
		_inv_zoom = 0;	
	}  else {
		_inv_zoom = 1 / cam_zoom;	
	}
	var _proj_mat = matrix_build_projection_ortho(viewWidth * _inv_zoom, viewHeight * _inv_zoom, 1, 10000);
	camera_set_proj_mat(camera, _proj_mat);
	must_update_proj = false;
}

if(must_update_view){
	// 判断跟踪目标
	if(instance_exists(target)){
		x = lerp(x, target.x, followLerpSpeed);
		y = lerp(y, target.y, followLerpSpeed);
	}
	// 边界判断
	if(instance_exists(bound)){
		x = clamp(x, bound.x + viewWidth * 0.5, bound.x + bound.sprite_width - viewWidth * 0.5);
		y = clamp(y, bound.y + viewHeight * 0.5, bound.y + bound.sprite_height - viewHeight * 0.5);
	}
	
	var _x = x + position_offset_x;
	var _y = y + position_offset_y;
	var _view_mat = matrix_build_lookat(_x, _y, z, _x, _y, 0, cam_up_x, cam_up_y, 0);
	camera_set_view_mat(camera, _view_mat);
	must_update_view = false;
}
