// @desc 发送事件
function gms2ESSendEvent(topic, payload){
	with(obj_GMS2EventManager) {
		if !ds_map_exists(eventMap, topic) return;
		var eventInfoList = eventMap[? topic];
		var len = ds_list_size(eventInfoList);
		var index = 0;
		repeat(len) {
			var eventInfo = eventInfoList[| index];
			var receiver = eventInfo.receiver;
			var handler = eventInfo.handler;
			// 如果事件接收者不存在 或 事件处理程序返回了true
			// 那么调用完事件以后就移除该事件
			var remove = false;
			// 检测事件接收者是否存在
			if !instance_exists(receiver) remove = true;
			else {
				with(receiver) {
					remove = script_execute(handler, payload);
				}
			}
			if remove {
				gms2ESRemoveEventListener(topic, eventInfo);
				index--;
			}
			index++;
		}
	}
}