class StoryDiffer

  constructor: (console) ->
    @console = console

  run: (options, andThen) ->
    if options.parameters.length > 0
      @console.log "git-story: don't know what to do with '#{options.parameters[0]}'"
    andThen()


module.exports = StoryDiffer
