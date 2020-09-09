// @desc 移动相机
function gms2CameraMove(cam, _expectX, _expectY, speed, _ignoreBound){
	if (speed<=0) return;
	with(cam) {
		if(moving || lerping || instance_exists(target)) {
			return;
		}
		moving = true;
		expectX = _expectX;
		expectY = _expectY;
		moveSpeed = speed;
		if _ignoreBound {
			ignoreBound = _ignoreBound;
		} else {
			expectX = clamp(expectX, bound.x + halfWidth, bound.x + bound.sprite_width - halfWidth);
			expectY = clamp(expectY, bound.y + halfHeight, bound.y + bound.sprite_height - halfHeight);
		}
	}
}