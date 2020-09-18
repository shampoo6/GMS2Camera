// @desc 注册事件
function gms2ESAddEventListener(topic, eventInfo) {
	with(obj_GMS2EventManager) {
		// 获取eventInfo列表
		var eventInfoList = noone;
		if !ds_map_exists(eventMap, topic) {
			eventInfoList = ds_list_create();
			ds_map_add(eventMap, topic, eventInfoList);
		} else {
			eventInfoList = eventMap[? topic];
		}
		// 查看是否对象已经存在
		var index = ds_list_find_index(eventInfoList, eventInfo);
		if index == -1 {
			ds_list_add(eventInfoList, eventInfo);
		}
	}
}