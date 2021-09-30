var config = {
  plgPath:         './build',
  plgCategory:    'CMO Export',
  pluginFilename: 'cmo_sibmei.plg',
  linkLibraries: [
    'cmoBrackets.plg',
    'cmoBatchExport.plg',
    'testCmoBrackets.plg',
    'bracketTestFiles',
    'postprocess.bat',
    'postprocess.sh'
  ],
  importDir:      './import',
  buildDir:       './build',
  srcDir:         './src',
  testDir:        './test',
  libDir:         './lib'
};

module.exports = config;
