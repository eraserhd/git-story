path = require 'path'
Options = require path.join(path.dirname(__filename), 'options')

class OptionParser

  constructor: (configReader) ->
    @configReader = configReader

  parse: (argv) ->
    config = @configReader.readConfig()
    new Options argv[0], argv[1], argv.slice(2), config


module.exports = OptionParser
