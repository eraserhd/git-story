path = require 'path'

class ActionLoader
  constructor: (requirer = require) ->
    @requirer = requirer

  load: (action_name) ->
    @requirer @_path(action_name)

  _path: (action_name) ->
    path.dirname(__filename) + '/actions/' + action_name

module.exports = ActionLoader
