function Run() {
    if (not InitGlobals())
    {
        return null;
    }
    meifile = Export(Sibelius.ActiveScore);
    Postprocess(CreateSparseArray(meifile));
}  //$end


function BatchExport() {
    if (not InitGlobals())
    {
        return null;
    }
    folder = Sibelius.SelectFolder();
    if (null = folder)
    {
        return null;
    }

    meiFiles = CreateSparseArray();

    for each SIB file in folder
    {
        if (not Sibelius.Open(file.NameWithExt, True))
        {
            return null;
        }
        meiFiles.Push(Export(Sibelius.ActiveScore));
        Sibelius.CloseWindow(false);
    }

    Postprocess(meiFiles);
}  //$end


function InitGlobals() {
    Self._property:Standalone = true;

    if (not Sibelius.Plugins.Contains('sibmei4'))
    {
        return Sibelius.MessageBox('Please install the sibmei4 plugin');
    }

    if (not sibmei4.InitGlobals(CreateSparseArray(PLGNAME)))
    {
        return Sibelius.MessageBox('Could not initialize sibmei4');
    }

    return true;
} //$end


function Export(score) {
    meifile = score.FileName.Name & '.mei';
    ToVoice1(score);
    sibmei4.DoExport(meifile);
    return meifile;
} //$end


function Postprocess(meiFiles) {
    pluginDir = GetPluginDir(PluginName);
    if (Sibelius.PathSeparator = '/')
    {
        // We're on Mac – this is untested!
        script = pluginDir & 'postprocess.sh';
    }
    else
    {
        // We're on Windows
        script = pluginDir & 'postprocess.bat';
    }

    parameters = CreateSparseArray(
        pluginDir & 'CmoMeiPostprocessor.jar',
        '--xslt-dir',
        pluginDir & 'xslts'
    ).Concat(meiFiles);

    if (not Sibelius.LaunchApplication(script, parameters))
    {
        Sibelius.MessageBox('Could not trigger postprocessing');
    }
} //$end


function ToVoice1(score) {
    // We want to prevent sibmei from complaining about wrong voice attachment
    for each staff in score
    {
        for each bar in staff
        {
            for each object in bar
            {
                if (object.VoiceNumber = 0)
                {
                    object.SetVoice(1, true);
                }
            }
        }
    }
} //$end
