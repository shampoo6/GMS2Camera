/// @description 初始化相机

#macro mainCamera view_camera[0]

viewWidth = tileWidth * blocksWidth;
viewHeight = tileHeight * blocksHeight;

// 设置视口
camera_set_view_size(mainCamera, viewWidth, viewHeight);
// 设置ui尺寸
display_set_gui_size(viewWidth, viewHeight);
// 设置画布
surface_resize(application_surface, viewWidth*windowScale, viewHeight*windowScale);
// 设置窗口
window_set_size(viewWidth*windowScale, viewHeight*windowScale);

alarm[0] = 1;