/*
id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
uid: String - getPlayerUID of the leaving client. The same as Steam ID (same as _uid param)
name: String - profileName of the leaving client (same as _name param)
jip: Boolean - didJIP of the leaving client (same as _jip param)
owner: Number - owner id of the leaving client (same as _owner param)
*/

#include "OOP_Light\OOP_Light.h"
#include "Message\Message.hpp"
#include "TFE\messages.hpp"

diag_log format ["[TFE] Info: Player disconnected: %1", _this];

params ["_id", "_uid", "_name", "_jip", "_owner"];

private _msg = MESSAGE_NEW();
_msg set [MESSAGE_ID_TYPE, MESSAGE_TYPE_CLIENT_DISCONNECTED];
private _msgData = [_uid, _owner];
_msg set [MESSAGE_ID_DATA, _msgData];
//diag_log format ["==== On player connect: sending message: %1", _msg];
CALL_METHOD(gTFE, "postMessage", [_msg]);