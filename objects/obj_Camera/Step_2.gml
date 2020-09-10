/// @description 相机移动，缩放，旋转
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

	// 边界判断
	if(instance_exists(bound) && !ignoreBound){
		x = clamp(x, bound.x + halfWidth, bound.x + bound.sprite_width - halfWidth);
		y = clamp(y, bound.y + halfHeight, bound.y + bound.sprite_height - halfHeight);
	}
	
	if (moving || lerping) && (abs(x - expectX) <= deadzone && abs(y - expectY) <= deadzone) {
		x = expectX;
		y = expectY;
		moving = false;
		lerping = false;
		ignoreBound = false;
		motion_set(0, 0);
			
		var _view_mat = matrix_build_lookat(x, y, z, x, y, 0, cam_up_x, cam_up_y, 0);
		camera_set_view_mat(camera, _view_mat);
			
		// 发起移动结束事件
		if instance_exists(controller) {
			event_perform_object(controller, ev_other, ev_user0);
		}
	}
	else {
		var _x = x + position_offset_x;
		var _y = y + position_offset_y;
		var _view_mat = matrix_build_lookat(_x, _y, z, _x, _y, 0, cam_up_x, cam_up_y, 0);
		camera_set_view_mat(camera, _view_mat);
	}
	
	must_update_view = false;
}
