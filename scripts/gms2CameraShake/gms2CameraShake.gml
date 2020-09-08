///@description Applies camera shake
///@param {id} cam An obj_Camera instance
///@param {real} amount The amount to shake
///@param {real} duration The duration in seconds
function gms2CameraShake(cam, amount, duration){

	with(cam){
		shake_duration = max(shake_duration, duration);
		shake_amount = max(shake_amount, amount);
	}

}