/*
TFE is a message receiver
*/

#include "..\OOP_Light\OOP_Light.h"
#include "..\Message\Message.hpp"

#define TIMER_INTERVAL 2

CLASS("TFE", "MessageReceiver")
	VARIABLE("hTimerThread");
	VARIABLE("msgLoop");
	VARIABLE("requiredServerNames");
	VARIABLE("clientLockedUpdateInterval");
	VARIABLE("clientUnlockedUpdateInterval");
	VARIABLE("serverAddressDisplay");
	VARIABLE("clientMessageDisplay");
	METHOD_FILE("handleMessage", "TaskForceEnforcer\TFE\handleMessage.sqf"); // Overwrite the base class method
	METHOD_FILE("handleClientState", "TaskForceEnforcer\TFE\handleClientState.sqf"); // Checks the status of the client and performs appropriate actions on it	
	
	// Override base class method. It must return the message loop where we post messages when we want to send a message to this object.
	METHOD("getMessageLoop") {
		params [["_thisObject", "", [""]]];
		private _return = GET_VAR(_thisObject, "msgLoop");
		_return
	} ENDMETHOD;
	
	METHOD("new") {
		params [["_thisObject", "", [""]], ["_msgLoop", "", [""]] ];
		SET_VAR(_thisObject, "msgLoop", _msgLoop);
		
		// Read settings
		private _settings = call compile preprocessFileLineNumbers "TaskForceEnforcer\settings.sqf";
		diag_log format ["[TFE] Info: Settings: %1", _settings];
		_settings params ["_requiredServerNames",
							"_clientLockedUpdateInterval",
							"_clientUnlockedUpdateInterval",
							"_timerInterval",
							"_TS3ServerAddressDisplay",
							"_clientMessageDisplay"];
		SET_VAR(_thisObject, "requiredServerNames", _requiredServerNames);
		SET_VAR(_thisObject, "clientLockedUpdateInterval", _clientLockedUpdateInterval);
		SET_VAR(_thisObject, "clientUnlockedUpdateInterval", _clientUnlockedUpdateInterval);
		SET_VAR(_thisObject, "serverAddressDisplay", _TS3ServerAddressDisplay);
		SET_VAR(_thisObject, "clientMessageDisplay", _clientMessageDisplay);
		// Start an aux timer thread to generate timer messages
		private _hThread = [_thisObject, TIMER_INTERVAL] spawn compile preprocessFileLineNumbers "TaskForceEnforcer\TFE\timerThread.sqf"; // TFE object, timer interval
		SET_VAR(_thisObject, "hTimerThread", _hThread);
	} ENDMETHOD;
ENDCLASS;