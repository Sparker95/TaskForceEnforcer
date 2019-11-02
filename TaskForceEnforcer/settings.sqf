// You can change these settings

// The array of TS3 server names where the client must connect
private _TS3ServerNames = ["Antistasi Official"];

// Update interval in seconds for clients who have not connected to the right TS3 server
private _clientLockedUpdateInterval = 2; 

// Update interval in seconds for clients who have connected to the right server
private _clientUnlockedUpdateInterval = 8;

// Resolution of the timer in seconds: how often the addon will check if clients should be queried for their state
private _timerInterval = 3;

// Client will be shown which TS3 address to connect to
private _TS3ServerAddressDisplay = "206.221.183.138:9987";

// The message to show to the client
private _clientMessageDisplay = "Hello and welcome to Antistasi official server!\n\n
								If you want to play here, you must install the TFAR addon and join our TeamSpeak server\n\n
								Our TS3 server address: %1\n\n
								Your TFAR addon state: %2\n
								Your TFAR TS3 plugin state: %3";

// return - don't change anything here
[_TS3ServerNames,
_clientLockedUpdateInterval,
_clientUnlockedUpdateInterval,
_timerInterval,
_TS3ServerAddressDisplay,
_clientMessageDisplay]