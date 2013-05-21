class ConfigReader

  constructor: (@fs = require 'fs') ->

  readConfig: (continueWith) ->
    @fs.readFile @_configFile(), (error, contents) ->
      return continueWith {} if error
      config = JSON.parse contents.toString()
      continueWith config

  _configFile: ->
    process.env.HOME + '/.git-story'

module.exports = ConfigReader
