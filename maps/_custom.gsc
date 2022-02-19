#include maps\_utility;
#include common_scripts\utility; 
#include maps\_zombiemode_utility;

init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");
	self.initial_spawn = 1;
	for(;;)
	{
		self waittill("spawned_player");
		if (self.initial_spawn == 1)
		{
			self.initial_spawn = 0;
		}
	}
}
