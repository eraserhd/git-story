
class Options

  constructor: (path, action, parameters) ->
    @path = path
    @action = action
    @parameters = parameters

  @parse: (argv) ->
    new @ argv[0], argv[1], argv.slice(2)


module.exports = Options
