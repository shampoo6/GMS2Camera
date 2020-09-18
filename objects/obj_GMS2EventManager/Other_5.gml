/// @description Insert description here
// 清空已注册的事件监听程序，因为下一个房间中不一定存在已有的事件接收者对象
if !ds_map_empty(eventMap) {
	ds_map_clear(eventMap);
}