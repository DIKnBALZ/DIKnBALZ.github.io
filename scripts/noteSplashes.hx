// boobies
static var splashSprite:String = 'game/noteSplashes';
static var splashCenterOffsets:Bool = true;
static var splashOffsets:Array<Float> = [0,0];
static var splashAlpha:Float = 1;
function create() {
	FlxG.bitmap.add(Paths.image(splashSprite)); // cache the splashSprite image i think
}
function onPlayerHit(event:NoteHitEvent) {
	if (event.note.isSustainNote || event.rating != "sick") return;
	if (!FlxG.save.data.noteSplashes) return;

	var splash = new FlxSprite();
	splash.frames = Paths.getSparrowAtlas(splashSprite);
	splash.cameras = [camHUD];
	splash.setPosition(playerStrums.members[event.note.noteData].x - 77, playerStrums.members[event.note.noteData].y - 100);

	splash.animation.addByPrefix('note0-0', 'note splash purple 1', 24, false);
	splash.animation.addByPrefix('note1-0', 'note splash blue 1', 24, false);
	splash.animation.addByPrefix('note2-0', 'note splash green 1', 24, false);
	splash.animation.addByPrefix('note3-0', 'note splash red 1', 24, false);
	splash.animation.addByPrefix('note0-1', 'note splash purple 2', 24, false);
	splash.animation.addByPrefix('note1-1', 'note splash blue 2', 24, false);
	splash.animation.addByPrefix('note2-1', 'note splash green 2', 24, false);
	splash.animation.addByPrefix('note3-1', 'note splash red 2', 24, false);
	splash.animation.play('note' + Std.string(event.note.noteData % 4) + '-' + FlxG.random.int(0, 1), true);
	splash.animation.curAnim.frameRate += FlxG.random.int(-2, 2);
	splash.alpha = splashAlpha;
	splash.animation.finishCallback = function(a) {
		splash.kill();
		remove(splash, true);
	}
	if (splashCenterOffsets) splash.centerOffsets();
	splash.offset.x += splashOffsets[0];
	splash.offset.y += splashOffsets[1];
	add(splash);
}