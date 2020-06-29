params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

diag_log format ["[TFE] Info: Player connecting: %1", _this];

//Need to check if the client has an interface.
[[_id, _uid, _name, _jip, _owner], 
{ 
	(_this + [hasInterface]) remoteExecCall ["TFE_fnc_handlePlayerConnected", 2]; 
}
] remoteExecCall ["call", _owner];