/// @description Insert description here

if (keyboard_check(ord("A"))) {
	x -= delta_time * 0.000001 * moveSpeed;
}
else if (keyboard_check(ord("D"))) {
	x += delta_time * 0.000001 * moveSpeed;
}

if (keyboard_check(ord("W"))) {
	y -= delta_time * 0.000001 * moveSpeed;
}
else if (keyboard_check(ord("S"))) {
	y += delta_time * 0.000001 * moveSpeed;
}