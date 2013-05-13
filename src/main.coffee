path = require('path')
Options = require path.join(path.dirname(__filename), 'options')
ActionLoader = require path.join(path.dirname(__filename), 'action_loader')

class Main
  constructor: (loader = new ActionLoader) ->
    @loader = loader

  main: (argv) ->
    options = Options.parse argv
    action_class = @loader.load options.action
    action_instance = new action_class
    action_instance.run(options)

module.exports = Main
