# Task Force Enforcer
A server-side addon for ARMA 3 to force players join a specific TS3 server with TFAR enabled.

This addon will periodically query clients' TFAR status and lock their controls if they are not on a specific server or if their TFAR is disabled. Clients must not load this addon. It must be loaded as a server-side addon.

## How to set it up
All the neccessary settings are located in `settings.sqf` file. Follow the example to fill in your server name, IP address and displayed message. You can change the status polling intervals as well. Then you will have to make a .pbo of this addon.

## OOP_Light
This addon is written with OOP_Light, check my repository for further info: https://github.com/Sparker95/OOP-Light
