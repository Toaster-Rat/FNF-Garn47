import funkin.backend.assets.ModsFolder;

function preStateSwitch()
    if (ModsFolder.currentModFolder != 'FNF Garn47')
        ModsFolder.switchMod('FNF Garn47');