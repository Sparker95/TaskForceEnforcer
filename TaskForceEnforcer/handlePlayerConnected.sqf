/*
id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
uid: String - getPlayerUID of the joining client. The same as Steam ID (same as _uid param)
name: String - profileName of the joining client (same as _name param)
jip: Boolean - didJIP of the joining client (same as _jip param)
owner: Number - owner id of the joining client (same as _owner param)
*/

#include "OOP_Light\OOP_Light.h"
#include "Message\Message.hpp"
#include "TFE\messages.hpp"

params ["_id", "_uid", "_name", "_jip", "_owner", "_hasInterface"];

if (_hasInterface) then {
	diag_log format ["[TFE] Info: Player connected: %1", _this];
	private _msg = MESSAGE_NEW();
	_msg set [MESSAGE_ID_TYPE, MESSAGE_TYPE_CLIENT_CONNECTED];
	private _msgData = [_uid, _owner];
	_msg set [MESSAGE_ID_DATA, _msgData];
	//diag_log format ["==== On player connect: sending message: %1", _msg];
	CALL_METHOD(gTFE, "postMessage", [_msg]);
} else {
	diag_log format ["[TFE] Info: server or headless client filtered out", _this];
};