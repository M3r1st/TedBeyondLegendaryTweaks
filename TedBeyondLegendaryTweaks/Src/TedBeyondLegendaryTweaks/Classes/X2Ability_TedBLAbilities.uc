// This is an Unreal Script

class X2Ability_TedBLAbilities extends X2Ability;


static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;
    Templates.AddItem(CreateGrubRegeneration());
    return Templates;
}

static function X2AbilityTemplate CreateGrubRegeneration()
{
    local X2AbilityTemplate Template;
    local X2Effect_Regeneration RegenerationEffect;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'GrubRegeneration');
    Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_hunter";

    Template.bDontDisplayInAbilitySummary = true;

    Template.AdditionalAbilities.AddItem('Regeneration');

    Template.AbilitySourceName = 'eAbilitySource_Perk';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Neutral;

    Template.AbilityToHitCalc = default.DeadEye;
    Template.AbilityTargetStyle = default.SelfTarget;

    Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

    RegenerationEffect = new class'X2Effect_Regeneration';
    RegenerationEffect.BuildPersistentEffect(1,  true, true, false, eGameRule_PlayerTurnBegin);
    RegenerationEffect.HealAmount = 2;
    Template.AddTargetEffect(RegenerationEffect);

    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

    return Template;
}