function Initialize() {
    //$module(cmo_sibmei)
    //Self._property:Logfile = GetTempDir() & LOGFILE;

    AddToPluginsMenu(PluginName,'Run');
}//$end

function InitSibmeiExtension (api) {
    //$module(cmo_sibmei)
    Self._property:api = api;
    Self._property:libmei = api.libmei;

    Self._property:CustomSymbolMap = CreateDictionary(
        '404', CreateSparseArray('Dir', null, 
            CreateSparseArray('Symbol', 
                CreateDictionary('glyph.auth', 'smufl', 'glyph.name', 'textTupletBracketStartLongStem', 'glyph.num', 'U+E201'))),
        '405', CreateSparseArray('Dir', null, 
            CreateSparseArray('Symbol', 
                CreateDictionary('glyph.auth', 'smufl', 'glyph.name', 'textTupletBracketEndLongStem', 'glyph.num', 'U+E203')))
    );
    
    api.RegisterSymbolHandlers(CreateDictionary(
        'Index', CreateDictionary(
            '404', 'PipeIndexControlEvent',
            '405', 'PipeIndexControlEvent'
            )
        ), Self);

    Self._property:CustomTextMap = CreateDictionary(
        'Section', CreateSparseArray('Dir', CreateDictionary('type', 'Section')),
        'Subsection', CreateSparseArray('Dir', CreateDictionary('type', 'Subsection')),
        'Performance instruction', CreateSparseArray('Dir', CreateDictionary('type', 'performanceInstruction')),
        'Performance instruction (above)', CreateSparseArray('Dir', CreateDictionary('type', 'performanceInstruction', 
            'place', 'above'))
    );

    api.RegisterTextHandlers(CreateDictionary(
        'StyleAsText', CreateDictionary(
            'Section', 'PipeCustomTexts',
            'Subsection', 'PipeCustomTexts',
            'Performance instruction', 'PipeCustomTexts',
            'Performance instruction (above)', 'PipeCustomTexts'
        )
    ), Self);
}//$end
