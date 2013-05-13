path = require('path')
Options = require path.join(path.dirname(__filename), 'options')
Loader = require path.join(path.dirname(__filename), 'loader')

class Main
  constructor: (loader = new Loader) ->
    @loader = loader

  main: (argv) ->
    options = Options.parse argv
    action_class = @loader.load options.action
    action_instance = new action_class
    action_instance.run(options)

module.exports = Main
