function update() if (FlxG.keys.justPressed.F6) {
    FlxG.bitmap.clearCache();
    FlxG.bitmap._cache.clear();
    Paths.tempFramesCache.clear();
    FlxG.resetState();
}