// @desc 通过lerp移动相机
function gms2CameraLerp(cam, _expectX, _expectY, speed, _ignoreBound){
	speed = clamp(speed, 0, 1);
	if (speed<=0) return;
	with(cam) {
		if(moving || lerping || instance_exists(target)) {
			return;
		}
		lerping = true;
		expectX = _expectX;
		expectY = _expectY;
		lerpRate = speed;
		if _ignoreBound {
			ignoreBound = _ignoreBound;
		} else {
			expectX = clamp(expectX, bound.x + halfWidth, bound.x + bound.sprite_width - halfWidth);
			expectY = clamp(expectY, bound.y + halfHeight, bound.y + bound.sprite_height - halfHeight);
		}
	}
}