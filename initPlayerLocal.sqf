["Init", []] spawn SNX_fnc_tfarSetup;

//Literally copied from oscillating unident
//Todo: Briefing
//Todo: Loadouts
//Todo: Logical radio channel layout
//Todo: Add insignias maybe?


//Briefing
player createDiaryRecord ["Diary", ["Mission Overview", "NATO has taken over a large portion of our former outposts in the north-eastern sector of the island. We're going to drive them away.<br/>
<br/>
We've divided this operation into two sectors, East and West. <br/>
Capture the lightly-guarded eastern sector for supplies, then move onto the western sector."]];

player createDiaryRecord ["Diary", ["Enemy presence", "East sector: Light NATO presence. <br/>
Reinforced outposts, minor infantry, MRAPs, LSVs and a single CROWS-equipped IFV.<br/>
<br/>
West sector: Heavy NATO presence.<br/> 
Heavily fortified outposts, ATGM killzones, MBTs, autocannon IFVs, LSVs, mortars, numerous infantry.
"]];
//Fancy links!
player createDiaryRecord ["Diary", ["Signals", "Preset radio channels and frequencies:<br/>
<font size=12>Clicking a link will set your channel.</font><br/>
<br/>
<font color='#ff0000'>SHORT RANGE:<br/></font>
<execute expression='[(call TFAR_fnc_activeSwRadio), 0]  call TFAR_fnc_setSwChannel;'>
Alpha, CH1 
(<font color='#99ff99'>100</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 1]  call TFAR_fnc_setSwChannel;'>
Bravo, CH2
(<font color='#99ff99'>110</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 2]  call TFAR_fnc_setSwChannel;'>
Charlie, CH3
(<font color='#99ff99'>120</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 3]  call TFAR_fnc_setSwChannel;'>
Delta, CH4
(<font color='#99ff99'>130</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 4]  call TFAR_fnc_setSwChannel;'>
Mars Frame, CH5
(<font color='#99ff99'>140</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 5]  call TFAR_fnc_setSwChannel;'>
Jupiter Frame, CH6
(<font color='#99ff99'>150</font>)
</execute><br/>
<execute expression='[(call TFAR_fnc_activeSwRadio), 7]  call TFAR_fnc_setSwChannel;'>
Command Net, CH8
(<font color='#99ff99'>50</font>)
</execute><br/>
<br/>
<font color='#3366ff'>LONG RANGE:<br/></font>
Command Net, CH1 (<font color='#99ff99'>50</font>)
"]];

player createDiaryRecord ["Diary", ["Assets", "You have at your disposal:<br/>
<br/>
- 4 FV-720 Mora IFVs (Callsign: Heart) <br/>
- 1  WY-55 Hellcat w/ 2x Scalpel ATGM (Callsign: Mars Frame)<br/>
- 1 CH-49 Mohawk (Callsign: Jupiter Frame)<br/>
- 3 Strider MRAPs
"]];


/****************************

			Gear!

****************************/


/*
removeallweapons player; 
removeAllItems player;
removeAllAssignedItems player;
removeBackpack player;

player forceAddUniform "U_B_CombatUniform_mcam_vest";
player addHeadgear "H_HelmetSpecB_paint2";


player addWeapon "Binocular";
player linkItem "ItemRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemAndroid";	
player addItem "NVGoggles";

//set up gear for specific types first
switch (typeOf player) do 
{
	case "B_Soldier_SL_F": //Lead
		{
			player addBackpack "tf_rt1523g_big";
			player addVest "V_PlateCarrier1_rgr";
			player addHeadgear "H_Cap_oli_hs";
			
			player addMagazines ["30Rnd_65x39_caseless_mag_Tracer",6];
			player addWeapon "arifle_MX_F";
			player addPrimaryWeaponItem "optic_Hamr";
			player addPrimaryWeaponItem "ACE_muzzle_mzls_H";
			player addMagazines ["11Rnd_45ACP_Mag",2];
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "ACE_muzzle_mzls_smg_01";
			player addHandgunItem "optic_MRD";
			
						
		};
	
	case "B_engineer_F": //Demo expert
		{
			player addVest "V_PlateCarrier1_rgr";
			player addBackpack "B_Kitbag_mcamo";
			
			player addMagazines ["30Rnd_65x39_caseless_mag_Tracer",6];
			player addWeapon "arifle_MX_F";
			player addPrimaryWeaponItem "optic_Hamr";
			player addPrimaryWeaponItem "ACE_muzzle_mzls_H";
			player addMagazines ["11Rnd_45ACP_Mag",2];
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "ACE_muzzle_mzls_smg_01";
			player addHandgunItem "optic_MRD";
			player addItem "Toolkit";
			player addItem "ACE_defusalKit";
			player addItem "ACE_clacker";
			player addItem "ACE_EntrenchingTool";
			player addMagazines["DemoCharge_Remote_Mag", 3];
			
		};
		
	case "B_soldier_UAV_F": //Demo expert
		{
			player addBackpack "B_UAV_01_backpack_F";
			player addVest "V_PlateCarrier1_rgr";
			
			player addMagazines ["30Rnd_65x39_caseless_mag_Tracer",6];
			player addWeapon "arifle_MX_F";
			player addPrimaryWeaponItem "optic_Hamr";
			player addPrimaryWeaponItem "ACE_muzzle_mzls_H";
			player addMagazines ["11Rnd_45ACP_Mag",2];
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "ACE_muzzle_mzls_smg_01";
			player addHandgunItem "optic_MRD";
			player linkItem "B_UavTerminal";
			player addItem "ItemAndroid";
			
						
		};
	
	case "B_medic_F": //Medic
		{
			player addVest "V_PlateCarrier1_rgr";
			player addBackpack "B_TacticalPack_mcamo";
			player addMagazines ["30Rnd_65x39_caseless_mag_Tracer",6];
			player addWeapon "arifle_MX_F";
			player addPrimaryWeaponItem "optic_Hamr";
			player addPrimaryWeaponItem "ACE_muzzle_mzls_H";
			player addMagazines ["11Rnd_45ACP_Mag",2];
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "ACE_muzzle_mzls_smg_01";
			player addHandgunItem "optic_MRD";
			
		
			if ( ace_medical_level == 2) then 
				{
					player AddItem "ACE_surgicalKit";
					player AddItem "ACE_Defibrillator";
					for "_i" from 1 to 15 do {player addItem "ACE_morphine";};
					for "_i" from 1 to 15 do {player addItem "ACE_epinephrine";};
					for "_i" from 1 to 5 do {player addItem "ACE_bloodIV";};
					for "_i" from 1 to 10 do {player addItem "ACE_fieldDressing";};
					for "_i" from 1 to 10 do {player addItem "ACE_tourniquet";};
					for "_i" from 1 to 20 do {player addItem "ACE_elasticBandage";};
					for "_i" from 1 to 30 do {player addItem "ACE_packingBandage";};
					for "_i" from 1 to 2 do {player addItem "ACE_personalAidKit";};
				}
				else
				{
					for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
					for "_i" from 1 to 20 do {player addItemToBackpack "ACE_fieldDressing";};
					for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
					for "_i" from 1 to 5 do {player addItemToBackpack "ACE_bloodIV";};
					for "_i" from 1 to 20 do {player addItemToBackpack "ACE_fieldDressing";};
				};
		};

	default
		{
			player forceAddUniform "U_B_CTRG_2";
			player addVest "V_Chestrig_blk";
			player addBackpack "B_AssaultPack_blk";
			player addHeadgear "H_HelmetCrew_B";
			player addItem "NVGoggles_OPFOR";
			
			player addItem "Toolkit";
			player addMagazines ["30Rnd_65x39_caseless_mag_Tracer",4];
			player addWeapon "arifle_MXC_Black_F";
			player addPrimaryWeaponItem "ACE_muzzle_mzls_H";
			player addMagazines ["11Rnd_45ACP_Mag",2];
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "ACE_muzzle_mzls_smg_01";
			player addHandgunItem "optic_MRD";
		};
};

switch (player getVariable "Role") do {
	case "Commander": 
	{ 
		player assignTeam "YELLOW"; 
		player addHeadgear "H_MilCap_mcamo";
	};
	
	case "Gunner": 
	{ 
		player assignTeam "RED"; 
	};
	
	case "Driver": 
	{ 
		player assignTeam "BLUE"; 
	};
};


//Medical for non-medics
if ( ace_medical_level == 2) then 
			{
				for "_i" from 1 to 2 do {player addItem "ACE_morphine";};
				for "_i" from 1 to 1 do {player addItem "ACE_epinephrine";};
				for "_i" from 1 to 2 do {player addItem "ACE_fieldDressing";};
				for "_i" from 1 to 4 do {player addItem "ACE_elasticBandage";};
				for "_i" from 1 to 6 do {player addItem "ACE_packingBandage";};
				for "_i" from 1 to 4 do {player addItem "ACE_tourniquet";};
				player additem "ACE_bloodIV_250";
			}
			else
			{
				for "_i" from 1 to 10 do {player addItem "ACE_fieldDressing";};
				for "_i" from 1 to 4 do {player addItem "ace_morphine";};
				for "_i" from 1 to 2 do {player addItem "ACE_epinephrine";};
			};

//ammo

player addMagazines ["SmokeShell",1];
player addMagazines ["MiniGrenade",1];


//Set radio channels based on assigned player variables.
//Vars are set on the unit in the editor.

waitUntil { call TFAR_fnc_haveSWRadio };
[(call TFAR_fnc_activeSwRadio), (player getVariable["Channel", 0])]  call TFAR_fnc_setSwChannel;

//same as above except for insignias
if ((player getVariable "Channel") != 4) then {
		[ player, "snx_ins_SelectionUniversity"] call BIS_fnc_setUnitInsignia; 
		[player, "snx_ins_SelectionUniversity"] remoteExec ["BIS_fnc_setUnitInsignia", 0, true];
	}
	else
	{
		[ player, "snx_ins_SupportSquad"] call BIS_fnc_setUnitInsignia; 
		[player, "snx_ins_SupportSquad"] remoteExec ["BIS_fnc_setUnitInsignia", 0, true];
	};*/
	
player addMPEventHandler ["MPKilled", 
{
	_kill = (_this select 0);
	hint "You have died. You will have to wait out the respawn timer unless a medic revives you with the Lazarus Touch."
	//Switch unit in condition to desired respawn unit
	_kill addAction ["Combat Life Save", "resurrect.sqf", nil, 6, false, true, "", "typeof _this == 'B_medic_F'", 2];
}];

player addMPEventHandler ["MPRespawn",
{
	_corpse = (_this select 1);
	deletevehicle _corpse;
}];