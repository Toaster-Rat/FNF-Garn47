
//imports
import funkin.backend.scripting.events.DrawEvent;

// creating variables
var creditsbackground = new FlxSprite().loadGraphic(Paths.image("credits/TempBackground"));
var currentSelected:Int = 0;
var nameArray:Array<String> = ["cyrus", "toasterRat", "tonica", "almso0t", "akira", "rylo", "cyberNiko", "kirinChibi"];
var creditGroup:Array<FlxSpriteGroup> = [];
var role = new FlxText();
var textBackground = new FlxSprite().makeSolid(500,100,FlxColor.BLACK); 
var description:Array<String> = ["Director, Musician, Artist", "Programmer", "Musician", "Musician", "Artist", "Artist", "Programmer", "Charter"];

function creditscroll(selecting:Int){
    CoolUtil.playMenuSFX(0);
    if(currentSelected>creditGroup.length - 1){
        currentSelected = 0;
    }
    if(currentSelected<0){
        currentSelected = creditGroup.length - 1;
    }
    trace(currentSelected);
    for(i in 0...creditGroup.length){
        FlxTween.cancelTweensOf(creditGroup[i]);
        var tweenDestination = (-currentSelected * FlxG.height/4) + (FlxG.height/4 * i);
        FlxTween.tween(creditGroup[i],{y:tweenDestination + (FlxG.height) - (FlxG.height/2)}, 0.3,{ease:FlxEase.quintOut});
        if (i == currentSelected){
            FlxTween.tween(creditGroup[i], {x:290}, 0.2,{ease:FlxEase.quintOut});
            creditGroup[i].members[1].animation.play("lose");
            trace(creditGroup[i].members[1]);
            role.text = description[i];
            role.x = textBackground.x + 20;
        }else{
        FlxTween.tween(creditGroup[i], {x:160}, 0.2,{ease:FlxEase.quintOut});
        creditGroup[i].members[1].animation.play("win");
        }
    }
}

// adding assets
function create() {
    add(creditsbackground);
    creditsbackground.scale.set(1.1,1.1);
    creditsbackground.screenCenter();
    add(textBackground);
    textBackground.alpha = .5;
    textBackground.x = FlxG.width - 500;
    add(role);
    role.text = "Director, Musician, Artist";
    role.x = textBackground.x + 20;
    role.y = textBackground.y + 30;
    role.size = 30;
    for(i in 0...nameArray.length){
        text = new Alphabet(0,0,nameArray[i],true);
        creditGroup[i] = new FlxSpriteGroup();
        creditGroup[i].add(text);
        add(creditGroup[i]);
        creditGroup[i].y = FlxG.height/2 + (FlxG.height/4 * i); // 10 = offset. 90 = margen.
        creditGroup[i].x = 160;
        if (Assets.exists(Paths.image("credits/" + nameArray[i]))){
            var icon = new FlxSprite().loadGraphic(Paths.image("credits/" + nameArray[i]), true, 150,150);
            creditGroup[i].add(icon);
            icon.animation.add("win",[0]);
            icon.animation.add("lose",[1]);
            icon.y -= 45;
            icon.x -= 150;
        }else{
            var icon = new FlxSprite().loadGraphic(Paths.image("credits/face"), true, 150,150);
            creditGroup[i].add(icon);
            icon.animation.add("win",[0]);
            icon.animation.add("lose",[1]);
            icon.y -= 45;
            icon.x -= 150;
        }
        creditGroup[0].members[1].animation.play("lose");
        creditGroup[0].x = 290;
    }

}

function update(elapsed:Float) {
    if(controls.BACK){
        FlxG.switchState(new MainMenuState());
    }
    if(controls.UP_P){
        creditscroll(currentSelected -= 1);
    }
    if(controls.DOWN_P){
        creditscroll(currentSelected += 1);
    }
    if(controls.ACCEPT){
        switch (currentSelected) {
            case 0: CoolUtil.openURL("https://youtube.com/@cyrusfire");
            case 1: CoolUtil.openURL("https://www.youtube.com/@ToasterRat47");
            case 2: CoolUtil.openURL("https://www.youtube.com/watch?v=-5R_sviyV4Y");
            case 3: CoolUtil.openURL("https://www.youtube.com/@almso0tmobile");
            case 4: CoolUtil.openURL("https://youtu.be/BVimiT9NrE4?si=SzZNNXy3f_GKmyVn");
            case 5: CoolUtil.openURL("https://www.youtube.com/@RyloB");
            case 6: CoolUtil.openURL("https://youtu.be/eJ9Bw-EU35I?si=8D2QYaRHexng8F2v");
            case 7: CoolUtil.openURL("https://x.com/KirinChibi");
        }
    }

    
   
}