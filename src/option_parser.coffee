path = require 'path'
Options = require path.join(path.dirname(__filename), 'options')

class OptionParser

  parse: (argv) ->
    new Options argv[0], argv[1], argv.slice(2)


module.exports = OptionParser
