#include "messages.hpp"
#include "..\OOP_Light\OOP_Light.h"
#include "..\Message\Message.hpp"

params ["_TFEObject", "_timerInterval"];

private _msg = MESSAGE_NEW();
_msg set [MESSAGE_ID_TYPE, MESSAGE_TYPE_TIMER];
private _msgID = -1; // Posted message ID, initial is -1 so that we can post the first message
private _msgLoop = CALL_METHOD(_TFEObject, "getMessageLoop", []);
while {true} do {
	sleep _timerInterval;
	if (CALL_METHOD(_msgLoop, "messageDone", [_msgID])) then {
		_msgID = CALL_METHOD(_TFEObject, "postMessage", [_msg]);
	} else {
		diag_log "[TFE] Info: Timer message has not been posted!";
	};
};