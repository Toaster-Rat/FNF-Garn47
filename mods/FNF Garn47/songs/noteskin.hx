function onPostStrumCreation(event) {
    event.strum.scale.set(6, 6);
    event.strum.antialiasing = false;
    FlxTween.cancelTweensOf(event.strum);
    event.strum.alpha = 0;
    event.strum.y=500;
    FlxTween.tween(event.strum,{y:70,alpha:1}, 1.3, {ease:FlxEase.quadOut });
    switch (event.strumID) {
        case 0: event.strum.x -= 12;
        case 3: event.strum.x += 12;
    }
        event.strum.offset.y += 12;
}

function onPostNoteCreation(event){
    event.note.scale.set(6, 6);
    event.note.antialiasing = false;
    if(event.note.noteData==0 ||event.note.noteData==3 ){
        event.note.offset.x += 12;
    }
    if (event.note.isSustainNote) {
        event.note.offset.y = 22;
    } else{
        event.note.offset.y += 12;
    }
    if (event.note.noteData==0 && event.note.isSustainNote && event.note.prevNote != null || event.note.noteData==3 && event.note.isSustainNote && event.note.prevNote != null)
		{
            event.note.offset.x -= 12;
        }
    
}
function update(elapsed:Float) {
    
}