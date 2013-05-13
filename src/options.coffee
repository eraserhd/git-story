
class Options

  constructor: (path, action) ->
    @path = path
    @action = action

  @parse: (argv) ->
    new @ argv[0], argv[1]


module.exports = Options
