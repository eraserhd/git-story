class ConfigReader

  constructor: (fs = require 'fs') ->
    @fs = fs

  readConfig: (callback) ->
    @fs.readFile @_configFile(), (error, contents) ->
      if error
        callback error, null
      else
        config = JSON.parse(contents.toString())
        callback null, config

  _configFile: ->
    process.env.HOME + '/.git-story'

module.exports = ConfigReader
