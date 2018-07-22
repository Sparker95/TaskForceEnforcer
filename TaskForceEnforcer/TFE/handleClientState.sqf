#include "..\OOP_Light\OOP_Light.h"

params [ ["_thisObject", "", [""]] , ["_clientData", "", [""]] ];

private _controlsLocked = CALL_METHOD(_clientData, "getControlsLocked", []);
private _serverName = CALL_METHOD(_clientData, "getServerName", []);
private _requiredServerNames = GET_VAR(_thisObject, "requiredServerNames");
private _needToQueryState = true; // Return value: should the state be queried immediately?
if (_controlsLocked) then {
	// Controls are locked now
	if (_serverName in _requiredServerNames) then {
		// Unlock client's controls
		CALL_METHOD(_clientData, "unlockControls", []);
		private _interval = GET_VAR(_thisObject, "clientUnlockedUpdateInterval");
		CALL_METHOD(_clientData, "setUpdateInterval", [_interval]);
		diag_log format ["[TFE] Info: Unlocked player's controls: UID: %1", GET_VAR(_clientData, "uid")];
		_needToQueryState = false;
	} else {
		
	};
} else {
	// Controls are unlocked now
	if (_serverName in _requiredServerNames) then {
		private _interval = GET_VAR(_thisObject, "clientUnlockedUpdateInterval");
		CALL_METHOD(_clientData, "setUpdateInterval", [_interval]);
	} else {
		// Lock client's controls
		private _args = [GET_VAR(_thisObject, "clientMessageDisplay"), GET_VAR(_thisObject, "serverAddressDisplay")];
		CALL_METHOD(_clientData, "lockControls", _args);
		private _interval = GET_VAR(_thisObject, "clientUnlockedUpdateInterval");
		CALL_METHOD(_clientData, "setUpdateInterval", [_interval]);
		diag_log format ["[TFE] Info: Locked player's controls: UID: %1", GET_VAR(_clientData, "uid")];
		_needToQueryState = false;
	};
};

_needToQueryState