# Sibelius tools for CMO

A collection of Sibelius tools for the Corpus Musicae Ottomanicae.

## CMO MEI 4 export

This plugin exports CMO data to MEI.  It includes a preprocessing and a postprocessing step.  Preprocessing moves all objects that are not attached to a voice to voice 1 to prevent sibmei problems. Postprocessing is done using a Java application.  It cleans the MEI from any unneeded content and encodes brackets and accidentals more semantically.

The Java postprocessing step is designed to work platform independently, but so far, it has only been tested on Windows.

## CMO bracket input helper

Supports the automatic generation and placement of grouping brackets.

## Installation

1. For postprocessing, Java must be installed on the system and must be on the path environment variable.  (The Java installer should automatically take care of that.)  Java 8 or higher is required.
2. To install the plugin collection, find the Sibelius' plugin folder.  This typically is `C:\Users\<USER_NAME>\AppData\Roaming\Avid\Sibelius\Plugins` on Windows. For more information (also for the Mac), see [the official documentation](https://www.sibelius.com/download/plugins/index.html?help=install) by Avid.
3. In the plugin folder, create two subfolders, one for the Sibmei 4 plugin (unless it is already installed) and one for the CMO export plugin. 
4. Download the release packages for [sibmei](https://github.com/music-encoding/sibmei/releases) and [cmo_sibmei](https://github.com/notengrafik/cmo_sibmei/releases). Make sure to download the latest release of sibmei major version 4 as CMO export currently works with MEI 4.
5. Extract the release packages into the respective folders created in step 3.

## Development

This plugin is compiled with gulp and plgToMSS. For a description how this works, see the [sibmei README](https://github.com/music-encoding/sibmei). If [this pull request](https://github.com/tido/plgToMSS/pull/6) is not yet merged, install [this fork](https://github.com/notengrafik/plgToMSS) of plgToMSS, otherwise the bracket input helper plugin will not work correctly.

### Distribution

For distribution (e.g. when creating releases), create a ZIP file with the following content:

```
cmo_sibmei
├── cmoBatchExport.plg
├── cmoBrackets.plg
├── cmo_sibmei.plg
├── postprocess.bat
├── postprocess.sh
├── CmoMeiPostprocessor.jar
├── xslts
|   ├── clean.xsl
```

`CmoMeiPostprocessor.jar` and the XSLT files are copied from the [CMO postprocessing tools](https://github.com/maxweberstiftung/CMO_MEI/).