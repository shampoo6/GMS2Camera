/// @description 初始化相机

#region 初始化相机属性

// 是否忽略边框
ignoreBound = false;

// 相机旋转
cam_rot = 0;
// 相机上方向向量x
cam_up_x = 0;
// 相机上方向向量y
cam_up_y = 1;
// 相机缩放
cam_zoom = 1;

viewWidth = tileWidth * blocksWidth;
viewHeight = tileHeight * blocksHeight;

halfWidth = viewWidth * 0.5;
halfHeight = viewHeight * 0.5;

x = halfWidth;
y = halfHeight;
z = -100;

#endregion

#region 设置相机

camera = camera_create();

var proj_mat = matrix_build_projection_ortho(viewWidth, viewHeight, 1, 10000);
camera_set_proj_mat(camera, proj_mat);

var view_mat = matrix_build_lookat(x, y, z, x, y, 0, cam_up_x, cam_up_y, 0);
camera_set_view_mat(camera, view_mat);

view_camera[camera_index] = camera;

must_update_view = false;
must_update_proj = false;

#endregion

#region 抖动属性

shake_amount = 0;
shake_duration = 0;

position_offset_x = 0;
position_offset_y = 0;

#endregion

#region 定义move移动属性

//deadzone = 5; 现在deadzone成为了可配置项
expectX = 0;
expectY = 0;
moving = false;
moveSpeed = 0;

#endregion

#region 定义lerp移动属性

lerping = false;
lerpRate = 1;

#endregion
