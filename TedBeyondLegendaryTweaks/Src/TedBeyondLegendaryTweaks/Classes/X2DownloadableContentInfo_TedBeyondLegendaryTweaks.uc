//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_TedBeyondLegendaryTweaks.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_TedBeyondLegendaryTweaks extends X2DownloadableContentInfo;

var config bool bRonarMode;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

static event OnPostTemplatesCreated ()
{
	local X2AbilityTemplateManager			AbilityTemplateManager;
	local X2ItemTemplateManager				ItemTemplateManager;
	local X2CharacterTemplateManager		CharacterTemplateManager;
	local X2StrategyElementTemplateManager  StrategyElementTemplateManager;
	local X2CharacterTemplate				CharTemplate;
	local X2WeaponTemplate					WeaponTemplate;
	local array<X2DataTemplate>				DataTemplateAllDifficulties;
	local X2DataTemplate					DataTemplate;

	StrategyElementTemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Disable a DE I'm giving baseline
	DisableDarkEvent(StrategyElementTemplateManager.FindStrategyElementTemplate('DarkEvent_PAOmen'));

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Swap Suppression for Suppressing Fire on Muton weapons

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('Muton_WPN'));

	if (WeaponTemplate != None)
	{
		WeaponTemplate.Abilities.RemoveItem('Suppression');
		WeaponTemplate.Abilities.AddItem('M31_SuppressingFire');
		WeaponTemplate.Abilities.AddItem('Suppression_LW');
		WeaponTemplate.iClipSize = 99;
		WeaponTemplate.InfiniteAmmo = true;
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('MutonM2_LW_WPN'));

	if (WeaponTemplate != None)
	{
		WeaponTemplate.Abilities.RemoveItem('Suppression');
		WeaponTemplate.Abilities.AddItem('M31_SuppressingFire');
		WeaponTemplate.Abilities.AddItem('Suppression_LW');
		WeaponTemplate.iClipSize = 99;
		WeaponTemplate.InfiniteAmmo = true;
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('MutonM3_LW_WPN'));

	if (WeaponTemplate != None)
	{
		WeaponTemplate.Abilities.RemoveItem('Suppression');
		WeaponTemplate.Abilities.AddItem('M31_SuppressingFire');
		WeaponTemplate.Abilities.AddItem('Suppression_LW');
		WeaponTemplate.iClipSize = 99;
		WeaponTemplate.InfiniteAmmo = true;
	}


	AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	// Ability stuff
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('Mindspin'));
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('PsiReanimation'));
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('PriestStasis'));
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('PoisonSpit'));
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('MarkTarget'));

	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('AnimaInversion'));
	MakeFreeAction(AbilityTemplateManager.FindAbilityTemplate('PsiBombStage1'));

	MakeAbilityNonTurnEnding(AbilityTemplateManager.FindAbilityTemplate('EnergyShield'));
	MakeAbilityNonTurnEnding(AbilityTemplateManager.FindAbilityTemplate('EnergyShieldMk3'));

	MakeUsableWhileBurning(AbilityTemplateManager.FindAbilityTemplate('StunLance'));
	MakeUsableWhileBurning(AbilityTemplateManager.FindAbilityTemplate('StunImpairingAbility'));

	// Characters
	CharacterTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();


	// Elite Engineer gets sting grenades + bluescreen bombs
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvHeavyEngineer', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('BluescreenBombs');
			CharTemplate.Abilities.AddItem('StingGrenades');
			CharTemplate.Abilities.AddItem('VolatileMix');
			CharTemplate.Abilities.AddItem('Shellshock_LW');
		}
	}

	// Mecs get Salvo

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvMEC_M1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Formidable');
			CharTemplate.Abilities.AddItem('HEATWarheads');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvMEC_M2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Formidable');
			CharTemplate.Abilities.AddItem('LayeredArmour_LW');
			CharTemplate.Abilities.AddItem('HEATWarheads');
		}
	}


	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvMEC_M3_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Formidable');
			CharTemplate.Abilities.AddItem('HEATWarheads');
			CharTemplate.Abilities.AddItem('LayeredArmour_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvMECArcherM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('HEATWarheads');
		}
	}


	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvMECArcherM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('HEATWarheads');
		}
	}

	// Let's give Salvo to Mutons as well
	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Shockwave_LW');
			CharTemplate.Abilities.AddItem('CombatEngineer');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('MutonM2_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Shockwave_LW');
			CharTemplate.Abilities.AddItem('CombatEngineer');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('MutonM3_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('Shockwave_LW');
			CharTemplate.Abilities.AddItem('CombatEngineer');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('LWDroneM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('MovingTarget_LW');
			CharTemplate.Abilities.AddItem('ZoneOfControl_LW');

			if(default.bRonarMode)
			{
				CharTemplate.Abilities.AddItem('SurvivalInstinct_LW');
			}
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('LWDroneM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('SurvivalInstinct_LW');
			CharTemplate.Abilities.AddItem('ZoneOfControl_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('PsiDroneM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('MovingTarget_LW');
			if(default.bRonarMode)
			{
				CharTemplate.Abilities.AddItem('SurvivalInstinct_LW');
			}
			CharTemplate.Abilities.AddItem('ZoneOfControl_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('PsiDroneM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('MovingTarget_LW');
			CharTemplate.Abilities.AddItem('SurvivalInstinct_LW');
			CharTemplate.Abilities.AddItem('ZoneOfControl_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('PsiDroneM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('SurvivalInstinct_LW');
			CharTemplate.Abilities.AddItem('ZoneOfControl_LW');
		}
	}

	// Grazing Fire (and maybe Concentration higher tier) for sentries
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvSentryM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('GrazingFire');
			CharTemplate.Abilities.AddItem('CombatAwareness');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvSentryM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('GrazingFire');
			CharTemplate.Abilities.AddItem('Concentration_LW');
			CharTemplate.Abilities.AddItem('CombatAwareness');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvSentryM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('GrazingFire');
			CharTemplate.Abilities.AddItem('Concentration_LW');
			CharTemplate.Abilities.AddItem('CombatAwareness');
		}
	}

	// Shieldbearers get Stasis Vests
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvShieldbearerM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.DefaultLoadout='AdvShieldBearerM2_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvShieldbearerM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.DefaultLoadout='AdvShieldBearerM3_Loadout_BL';
		}
	}

	
	CharacterTemplateManager.FindDataTemplateAllDifficulties('Viper', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Evasive');
		}
	}
	

	CharacterTemplateManager.FindDataTemplateAllDifficulties('ViperM2_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Evasive');
			CharTemplate.Abilities.AddItem('PALockjaw');
			CharTemplate.Abilities.AddItem('ViperMelee_Animation');
		}
	}


	CharacterTemplateManager.FindDataTemplateAllDifficulties('ViperM3_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Evasive');
			CharTemplate.Abilities.AddItem('PALockjaw');
			CharTemplate.Abilities.AddItem('ViperMelee_Animation');
		}
	}
	

	// Najas get Snap Shot
	CharacterTemplateManager.FindDataTemplateAllDifficulties('NajaM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SnapShot');
			CharTemplate.Abilities.AddItem('CenterMass');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('NajaM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SnapShot');
			CharTemplate.Abilities.AddItem('Lethal');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('NajaM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SnapShot');
			CharTemplate.Abilities.AddItem('AlphaMikeFoxtrot');
		}
	}

	// Grenadiers get Volatile Mix

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGrenadierM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('VolatileMix');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGrenadierM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Salvo');
			CharTemplate.Abilities.AddItem('VolatileMix');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGrenadierM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('F_SaltInTheWound');
			CharTemplate.Abilities.AddItem('VolatileMix');
		}
	}

	// Executioner for gunners

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGunnerM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Executioner_LW');
			CharTemplate.Abilities.AddItem('DedicatedSuppression_LW');
			CharTemplate.Abilities.AddItem('ShadowOps_Fortify');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGunnerM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Executioner_LW');
			CharTemplate.Abilities.AddItem('DedicatedSuppression_LW');
			CharTemplate.Abilities.AddItem('ShadowOps_Fortify');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGunnerM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Executioner_LW');
			CharTemplate.Abilities.AddItem('DedicatedSuppression_LW');
			CharTemplate.Abilities.AddItem('ShadowOps_Fortify');
		}
	}

	//Executioner + Bring Em On for sidewinders
	CharacterTemplateManager.FindDataTemplateAllDifficulties('SidewinderM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Executioner_LW');
			CharTemplate.Abilities.AddItem('Bringemon');
			CharTemplate.Abilities.AddItem('Aggression');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('SidewinderM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Executioner_LW');
			CharTemplate.Abilities.AddItem('Bringemon');
			CharTemplate.Abilities.AddItem('Aggression');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('SidewinderM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Fatality_LW');
			CharTemplate.Abilities.AddItem('Bringemon');
			CharTemplate.Abilities.AddItem('Aggression');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Archon', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
			CharTemplate.Abilities.AddItem('PAOmen');
			//CharTemplate.Abilities.AddItem('PASeriousBomber');
			CharTemplate.Abilities.AddItem('SkirmisherStrike');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('ArchonM2_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
			CharTemplate.Abilities.AddItem('PAOmen');
			//CharTemplate.Abilities.AddItem('PASeriousBomber');
			CharTemplate.Abilities.AddItem('SkirmisherStrike');
		}
	}

	// Andromedons get some acid buffs
	CharacterTemplateManager.FindDataTemplateAllDifficulties('Andromedon', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('ShadowOps_Mayhem_LW2');
			CharTemplate.Abilities.AddItem('F_SaltInTheWound');
		}
	}


	//Berserker gets Iron Skin + Resilience
	CharacterTemplateManager.FindDataTemplateAllDifficulties('Berserker', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Brawler');
			CharTemplate.Abilities.AddItem('IronSkin');
			CharTemplate.Abilities.AddItem('Resilience');
			CharTemplate.Abilities.AddItem('MZInvertCounter');
		}
	}

	// Troopers get Center Mass
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvTrooperM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('CenterMass');
			CharTemplate.DefaultLoadout='AdvTrooperM1_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvTrooperM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('CenterMass');
			CharTemplate.DefaultLoadout='AdvTrooperM2_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvTrooperM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('CenterMass');
			CharTemplate.DefaultLoadout='AdvTrooperM3_Loadout_BL';
		}
	}

	// Stun lancers
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvStunLancerM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('Blademaster');
			CharTemplate.Abilities.AddItem('Untouchable');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvStunLancerM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('Blademaster');
			CharTemplate.Abilities.AddItem('Untouchable');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvStunLancerM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('Blademaster');
			CharTemplate.Abilities.AddItem('Untouchable');
		}
	}

	// Priests

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvPriestM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Brawler');
			CharTemplate.DefaultLoadout='AdvPriestM1_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvPriestM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Brawler');
			CharTemplate.DefaultLoadout='AdvPriestM2_Loadout_BL';
		}
	}


	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvPriestM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Brawler');
			CharTemplate.DefaultLoadout='AdvPriestM3_Loadout_BL';
		}
	}


	// fancy advent
	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvVanguard', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Predator_LW');
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvShockTroop', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('LightningReflexes_LW');
			CharTemplate.Abilities.AddItem('Predator_LW');
			CharTemplate.Abilities.AddItem('CombatRushOnCrit');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvSergeantM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Predator_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvSergeantM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Predator_LW');
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGeneralM1_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
			CharTemplate.Abilities.AddItem('CombatAwareness');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvGeneralM2_LW', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
			CharTemplate.Abilities.AddItem('CombatAwareness');
		}
	}


	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvCommando', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('ShadowOps_Evasive');
			CharTemplate.DefaultLoadout='AdvCommando_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AdvScout', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('ShadowOps_Evasive');
			CharTemplate.DefaultLoadout='AdvScout_Loadout_BL';
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Cyberus', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Formidable');
			CharTemplate.Abilities.AddItem('Evasive');
		}
	}

	// Sectopod gets OG Impact Compensation

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Sectopod', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('ImpactCompensation_LW');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Gatekeeper', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('HardTarget');
			CharTemplate.Abilities.AddItem('Evasive');
			CharTemplate.Abilities.AddItem('SkirmisherReflex');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AshMutonDestroyerM1', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Cutthroat');
			CharTemplate.Abilities.AddItem('CoupdeGrace2');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AshMutonDestroyerM2', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Cutthroat');
			CharTemplate.Abilities.AddItem('CoupdeGrace2');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AshMutonDestroyerM3', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Cutthroat');
			CharTemplate.Abilities.AddItem('CoupdeGrace2');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('AshMutonDestroyerM4', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('Cutthroat');
			CharTemplate.Abilities.AddItem('CoupdeGrace2');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Hunter', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Prowler', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Harrier', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirst');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Harrier_Captain', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirst');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirstForAll');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Beleaguer', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirst');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('Muton_Beleaguer_Captain', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('WeaponsMaster');
			CharTemplate.Abilities.AddItem('ChosenImmuneMelee');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirst');
			CharTemplate.Abilities.AddItem('M31_ENEMY_BruhThirstForAll');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('CelatidGrub', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('GrubRegeneration');
		}
	}



	CharacterTemplateManager.FindDataTemplateAllDifficulties('CelatidPupa', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('F_SaltInTheWound');
		}
	}

	CharacterTemplateManager.FindDataTemplateAllDifficulties('CelatidAdult', DataTemplateAllDifficulties);

	foreach DataTemplateAllDifficulties (DataTemplate)
	{
		CharTemplate = X2CharacterTemplate(DataTemplate);

		if(CharTemplate != none)
		{
			CharTemplate.Abilities.AddItem('F_SaltInTheWound');
		}
	}

	ModifyLoadouts();

}

static function MakeAbilityNonTurnEnding(X2AbilityTemplate Template)
{
	local X2AbilityCost Cost;

	if(Template != None)
	{
		foreach Template.AbilityCosts(Cost)
		{
			if (Cost.IsA('X2AbilityCost_ActionPoints'))
			{
				X2AbilityCost_ActionPoints(Cost).bConsumeAllPoints = false;
			}
		}
	}
}

static final function MakeFreeAction(X2AbilityTemplate Template)
{
	local X2AbilityCost Cost;

	if(Template != None)
	{
		foreach Template.AbilityCosts(Cost)
		{
			if (Cost.IsA('X2AbilityCost_ActionPoints'))
			{
				X2AbilityCost_ActionPoints(Cost).iNumPoints = 1;
				X2AbilityCost_ActionPoints(Cost).bFreeCost = true;
				X2AbilityCost_ActionPoints(Cost).bConsumeAllPoints = false;
			}
		}
	}
}

static final function MakeUsableWhileBurning(X2AbilityTemplate Template)
{
	local X2Condition Condition;
	local X2Condition_UnitEffects UnitEffectCondition;

	if(Template != None)
	{
		foreach Template.AbilityShooterConditions (Condition)
		{
			UnitEffectCondition = X2Condition_UnitEffects(Condition);

			if(UnitEffectCondition != None)
			{
				UnitEffectCondition.RemoveExcludeEffect(class'X2StatusEffects'.default.BurningName);
			}
		}
	}
}


static function DisableDarkEvent(X2StrategyElementTemplate Template)
{
	local X2DarkEventTemplate DETemplate;

	DETemplate = X2DarkEventTemplate(Template);

	if(DETemplate != none)
	{
		DETemplate.CanActivateFn = DisableDE;
	}
}

function bool DisableDE(XComGameState_DarkEvent DarkEventState)
{
	return false;
}

static function UpdateAnimations(out array<AnimSet> CustomAnimSets, XComGameState_Unit UnitState, XComUnitPawn Pawn)
{
	if (UnitState.GetMyTemplateName() == 'Sectopod')
	{
		Pawn.Mesh.SetScale(2.0f);
		Pawn.MovementSpeedModifier=0.6f;

	}
}

static final function ModifyLoadouts()
{
	
    
    local array<name> LoadoutsToPatch;
    local InventoryLoadoutItem NewItem;

	// Nanoscale vests for more basic troops:

    LoadoutsToPatch.AddItem('AdvBioTrooperM1_Loadout');
	LoadoutsToPatch.AddItem('AdvBioTrooperM2_Loadout');
	LoadoutsToPatch.AddItem('AdvBioTrooperM3_Loadout');
	LoadoutsToPatch.AddItem('AdventDuelistM1_Loadout');
	LoadoutsToPatch.AddItem('AdventDuelistM2_Loadout');
	LoadoutsToPatch.AddItem('AdventDuelistM3_Loadout');
	LoadoutsToPatch.AddItem('AdventSniperM1_Loadout');
	LoadoutsToPatch.AddItem('AdventSniperM2_Loadout');
	LoadoutsToPatch.AddItem('AdventSniperM3_Loadout');
	LoadoutsToPatch.AddItem('FrostTrooper_M1_Loadout');
	LoadoutsToPatch.AddItem('FrostTrooper_M2_Loadout');
	LoadoutsToPatch.AddItem('FrostTrooper_M3_Loadout');

    NewItem.Item = 'NanofiberVest';

	AddItemToLoadouts(LoadoutsToPatch, NewItem);

	// Medics get Hazmat
	LoadoutsToPatch.length = 0;
	
	LoadoutsToPatch.AddItem('AdvMedicM1_Loadout');
	LoadoutsToPatch.AddItem('AdvMedicM2_Loadout');
	LoadoutsToPatch.AddItem('AdvMedicM3_Loadout');

	NewItem.Item = 'HazmatVest';

	AddItemToLoadouts(LoadoutsToPatch, NewItem);


	// Some latergame enemies get stainless vests
	LoadoutsToPatch.length = 0;
	
	LoadoutsToPatch.AddItem('Muton_Devastator_Loadout');
	LoadoutsToPatch.AddItem('MutonM3_LW_Loadout');

	NewItem.Item = 'RequiemStainlessVest';

	AddItemToLoadouts(LoadoutsToPatch, NewItem);

	// a few psi things get Niven Capacitor
	LoadoutsToPatch.length = 0;
	
	LoadoutsToPatch.AddItem('AdvWarlockM4_Loadout');
	LoadoutsToPatch.AddItem('AdvWarlockM3_Loadout');

	NewItem.Item = 'RequiemNivenBooster';

	AddItemToLoadouts(LoadoutsToPatch, NewItem);

	if(default.bRonarMode)
	{
		// Hellweave to some things that are vulnerable to melee
		LoadoutsToPatch.length = 0;
	
		LoadoutsToPatch.AddItem('SectoidM2_LW_Loadout');
		LoadoutsToPatch.AddItem('Muton_Hunter_Loadout');
		LoadoutsToPatch.AddItem('Muton_Prowler_Loadout');
		LoadoutsToPatch.AddItem('Muton_Harrier_Loadout');
		LoadoutsToPatch.AddItem('Muton_Harrier_Captain_Loadout');
		LoadoutsToPatch.AddItem('Muton_Beleaguer_Loadout');
		LoadoutsToPatch.AddItem('Muton_Beleaguer_Captain_Loadout');

		NewItem.Item = 'Hellweave';
		AddItemToLoadouts(LoadoutsToPatch, NewItem);
	}
}

static final function AddItemToLoadouts(array<name> LoadoutsToUpdate, InventoryLoadoutItem ItemToAdd)
{
	local X2ItemTemplateManager ItmMgr;
    local InventoryLoadout Loadout;
    local int idx;

	ItmMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    for(idx = 0; idx < ItmMgr.Loadouts.Length; idx++)
    {
        Loadout = ItmMgr.Loadouts[idx];
       // `Log("currently processing Loadout" @ Loadout.LoadoutName @ "at index" @ string(idx),,'TedLog');
        if(LoadoutsToUpdate.Find(Loadout.LoadoutName) != INDEX_NONE)
        {
            //`Log("got a match! Fixing loadout",,'TedLog');
            ItmMgr.Loadouts[idx].Items.AddItem(ItemToAdd);
        }
	}

}

exec function FindLoadout(name testloadoutname)
{
	local X2ItemTemplateManager ItmMgr;
	local int idx;
	local InventoryLoadout Loadout;
	local InventoryLoadoutItem loadoutitem;

	ItmMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	idx = ItmMgr.loadouts.find('loadoutname', testloadoutname);
	
	if(idx != -1)
	{
		loadout = ItmMgr.loadouts[idx];

		foreach loadout.items(loadoutitem)
		{
			class'Helpers'.static.OutputMsg("Item:" @ `SHOWVAR(loadoutitem.Item));
		}
	}
}

// Override pesky inventory slot restrictions for enemies so I can give them all the silly stuff we want.

static function bool CanAddItemToInventory_CH_Improved(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason, optional XComGameState_Item ItemState)
{

	local bool OverrideNormalBehavior;
	local bool DoNotOverrideNormalBehavior;

	// Prepare return values to make it easier for us to read the code.
	OverrideNormalBehavior = CheckGameState != none;
	DoNotOverrideNormalBehavior = CheckGameState == none;  

	// We don't care about item duplication and slots eating items and whatnot since this is enemies.
	if(CheckGameState != none && UnitState.GetTeam() == eTeam_Alien)
	{
		bCanAddItem = 1;
		return OverrideNormalBehavior;
	}

	// If it's not an enemy unit, don't touch it
	return DoNotOverrideNormalBehavior;
}