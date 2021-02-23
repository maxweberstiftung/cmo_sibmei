
function PipeIndexControlEvent (self, obj) {
    //$module(cmo_sibmei)

    myTemplate = CustomSymbolMap[obj.Index];
    controlEvent = api.HandleControlEvent(obj, myTemplate);  
}//$end


function PipeCustomTexts (self, obj) {
  //$module(cmo_sibmei)

  textEl = api.MeiFactory(CustomTextMap[obj.StyleAsText]);
  api.AddControlEventAttributes(obj, textEl);
  api.AddFormattedText(textEl, obj);
  
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

    MeiFactory(CreateSparseArray(
      'P', null,
      'This is ',
      CreateSparseArray('Rend', CreateDictionary('rend', 'italic'),
      'declarative'
      ),
      ' MEI generation.'
    ));

    Output:

    <p>This is <rend rend='italic'>declarative</rend> MEI generation.</p> */