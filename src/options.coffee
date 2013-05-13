
class Options

  constructor: (action) ->
    @action = action

  @parse: (argv) ->
    new @ argv[1]


module.exports = Options
