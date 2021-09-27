function GetPluginDir(plgTitle) {
    for each plugin in Sibelius.Plugins {
        if (plugin.Name = plgTitle) {
            return ParentDir(plugin.File);
        }
    }
} //$end


function ParentDir(path) {
    for i = Length(path) - 2 to 1 step -1 {
        if (CharAt(path, i) = Sibelius.PathSeparator) {
            return Substring(path, 0, i + 1);
        }
    }
} //$end
