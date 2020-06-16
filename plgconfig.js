var config = {
  plgPath:         './build',
  plgCategory:    'CMO Export',
  pluginFilename: 'cmo_sibmei.plg',
  linkLibraries:  [
    'sibmei4.plg', 'libmei4.plg', 'sibmei4_batch_mxml.plg', 'sibmei4_batch_sib.plg', 'sibmei4_test_runner.plg'
  ],
  importDir:      './import',
  buildDir:       './build',
  srcDir:         './src',
  testDir:        './test',
  libDir:         './lib'
};

module.exports = config;

