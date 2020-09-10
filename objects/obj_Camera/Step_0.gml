/// @description Insert description here
if(shake_duration > 0){
	shake_duration -=  delta_time * 0.000001;
	if(shake_duration <= 0){
		shake_duration = 0;
		position_offset_x = 0;
		position_offset_y = 0;
	} else {
		position_offset_x = random_range(-shake_amount, shake_amount) * 0.5;
		position_offset_y = random_range(-shake_amount, shake_amount) * 0.5;
	}
	must_update_view = true;
}

// 跟踪目标、平移、lerp移动 只能同时执行一个逻辑

// 跟踪逻辑
if(instance_exists(target) && !moving && !lerping) {
	x = lerp(x, target.x, followLerpSpeed);
	y = lerp(y, target.y, followLerpSpeed);
	must_update_view = true;
}

// 平移逻辑
if(moving && !instance_exists(target) && !lerping) {
	// 如果起始点和结束点间的距离，下一帧就能达到，那么就将当前位置设置为最终期望位置
	var dis = point_distance(x, y, expectX, expectY);
	if (dis <= moveSpeed * delta_time * 0.000001) {
		x = expectX;
		y = expectY;
	} else {
		var dir = point_direction(x, y, expectX, expectY);
		motion_set(dir, moveSpeed * delta_time * 0.000001);
	}
	must_update_view = true;
}

// lerp逻辑
if(lerping && !instance_exists(target) && !moving) {
	var _x = lerp(x, expectX, lerpRate);
	var _y = lerp(y, expectY, lerpRate);
	_x = abs(_x - expectX) < deadzone? expectX: _x;
	_y = abs(_y - expectY) < deadzone? expectY: _y;
	x = _x;
	y = _y;
	must_update_view = true;
}