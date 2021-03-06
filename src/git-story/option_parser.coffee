path = require 'path'
ConfigReader = require path.join(path.dirname(__filename), 'config_reader')
Options = require path.join(path.dirname(__filename), 'options')

class OptionParser

  constructor: (@configReader = new ConfigReader) ->

  parse: (argv, callback) ->
    @configReader.readConfig (config) ->
      options = new Options argv[1], argv.slice(2), config
      callback null, options


module.exports = OptionParser
