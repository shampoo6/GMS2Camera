// @desc 反注册事件
function gms2ESRemoveEventListener(topic, eventInfo) {
	with(obj_GMS2EventManager) {
		if !ds_map_exists(eventMap, topic) return;
		// 获取eventInfoList
		var eventInfoList = eventMap[? topic];
		var index = ds_list_find_index(eventInfoList, eventInfo);
		if  index != -1 {
			ds_list_delete(eventInfoList, index);
			// 如果没有观察者就删除
			if ds_list_size(eventInfoList) == 0 {
				ds_list_destroy(eventInfoList);
				ds_map_delete(eventMap, topic);
			}
		}
	}
}