class StoryDiffer

  constructor: (console) ->
    @console = console

  run: (options, andThen) ->
    @console.log "Don't know what to do with '#{options.parameters[0]}'"
    andThen()


module.exports = StoryDiffer
