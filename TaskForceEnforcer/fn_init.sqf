#include "OOP_Light\OOP_Light.h"

// Initialize functions
TFE_fnc_onPlayerConnected = compileFinal preprocessFileLineNumbers "TaskForceEnforcer\onPlayerConnected.sqf";
TFE_fnc_handlePlayerConnected = compileFinal preprocessFileLineNumbers "TaskForceEnforcer\handlePlayerConnected.sqf";
TFE_fnc_onPlayerDisconnected = compileFinal preprocessFileLineNumbers "TaskForceEnforcer\onPlayerDisconnected.sqf";

// Initialize event handlers
addMissionEventHandler ["PlayerConnected", TFE_fnc_onPlayerConnected];
addMissionEventHandler ["PlayerDisconnected", TFE_fnc_onPlayerDisconnected];

// Initialize OOP_Light
call compile preprocessFileLineNumbers "TaskForceEnforcer\OOP_Light\OOP_Light_init.sqf";

// Initialize MessageReceiver class
call compile preprocessFileLineNumbers "TaskForceEnforcer\MessageReceiver\MessageReceiver.sqf";

// Initialize MessageLoop class
call compile preprocessFileLineNumbers "TaskForceEnforcer\MessageLoop\MessageLoop.sqf";

// Initialize TFE class
call compile preprocessFileLineNumbers "TaskForceEnforcer\TFE\TFE.sqf";

// Initialize TFEClientData class
call compile preprocessFileLineNumbers "TaskForceEnforcer\TFEClientData\TFEClientData.sqf";

diag_log "[TFE] Info: Module init done";

// Create a new message loop
private _msgLoop = NEW("MessageLoop", []);

// Create a new TFE object
gTFE = NEW("TFE", [_msgLoop]);