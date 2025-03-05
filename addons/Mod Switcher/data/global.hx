import funkin.backend.assets.ModsFolder;

function preStateSwitch()
    if (ModsFolder.currentModFolder != 'FNFGarn47')
        ModsFolder.switchMod('FNFGarn47');