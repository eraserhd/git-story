ConfigReader = require '../lib/config_reader'
expect = require 'expect.js'

describe ConfigReader, ->

  beforeEach ->
    @readFileResult = ""
    fs =
      readFile: (filename, callback) =>
        callback null, @readFileResult
    @reader = new ConfigReader fs

  it 'responds to readConfig', ->
    expect(@reader.readConfig).to.be.a Function

  it 'calls back with the config', (done) ->
    @reader.readConfig (error, config) ->
      done()

