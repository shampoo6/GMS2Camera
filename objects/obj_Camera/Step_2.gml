/// @description 跟随目标
if (instance_exists(target)) {
	var cameraX = target.x - viewWidth * 0.5;
	var cameraY = target.y - viewHeight * 0.5;
	// 通过边框bound算极限位置
	var minX = bound.x;
	var maxX = bound.x + bound.sprite_width - viewWidth;
	var minY = bound.y;
	var maxY = bound.y + bound.sprite_height - viewHeight;
	
	cameraX = clamp(cameraX, minX, maxX);
	cameraY = clamp(cameraY, minY, maxY);
	
	cameraX = lerp(camera_get_view_x(mainCamera), cameraX, cameraMoveSpeed);
	cameraY = lerp(camera_get_view_y(mainCamera), cameraY, cameraMoveSpeed);
	
    camera_set_view_pos(mainCamera, cameraX, cameraY);
}
