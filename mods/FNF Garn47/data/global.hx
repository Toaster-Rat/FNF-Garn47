import funkin.menus.credits.CreditsMain;
 
var redirectStates:Map<FlxState, String> = [
    CreditsMain => "CustomStates/CreditsStuff",
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys())
        if (Std.isOfType(FlxG.game._requestedState, redirectState))
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
};