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
}//$end

function PipeIndexControlEvent (self, obj) {
    //$module(cmo_sibmei)

    myTemplate = CustomSymbolMap[obj.Index];
    controlEvent = api.HandleControlEvent(obj, myTemplate);  
}//$end


  /* Takes an array with the following content:

      0.  The capitalized tag name
      1.  A dictionary with attribute names and values (unlike tag names,
          attribute names are not capitalized). Can be null if no
          attributes are declared.
      2.  A child node (optional), represented by either a string for text
          or a SparseArray of the same form for a child element.
      3.  Any number of additional child nodes.
      ...

    DataToMEI(CreateSparseArray(
      'P', null,
      'This is ',
      CreateSparseArray('Rend', CreateDictionary('rend', 'italic'),
      'declarative'
      ),
      ' MEI generation.'
    ));

    Output:

    <p>This is <rend rend='italic'>declarative</rend> MEI generation.</p> */