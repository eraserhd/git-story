class StoryDiffer

  constructor: (my_console = console, @child_process = require 'child_process') ->
    @console = my_console

  run: (options, andThen) ->
    if options.parameters.length > 0
      @console.log "git-story: don't know what to do with '#{options.parameters[0]}'"
      andThen()
    else
      process = @child_process.spawn 'git', ['diff', 'origin/master...HEAD'],
        stdio: 'inherit'
      process.on 'exit', =>
        andThen()

module.exports = StoryDiffer
