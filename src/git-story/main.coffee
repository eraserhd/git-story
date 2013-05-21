path = require 'path'
ActionLoader = require path.join(path.dirname(__filename), 'action_loader')
OptionParser = require path.join(path.dirname(__filename), 'option_parser')

class Main
  constructor: (@loader = new ActionLoader, @parser = new OptionParser) ->

  main: (args) ->
    @parser.parse args, (error, options) =>
      action_class = @loader.load options.action
      action_instance = new action_class
      action_instance.run options, ->

module.exports = Main
