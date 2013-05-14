ConfigReader = require '../lib/config_reader'
expect = require 'expect.js'

describe ConfigReader, ->

  beforeEach ->
    @readFileResult = "{}"
    fs =
      readFile: (filename, callback) =>
        callback null, @readFileResult
    @reader = new ConfigReader fs

  it 'responds to readConfig', ->
    expect(@reader.readConfig).to.be.a Function

  it 'calls us back', (done) ->
    @reader.readConfig (error, config) ->
      done()

  it 'parses and gives us back the config', (done) ->
    @readFileResult = '{"foo": 42, "bar": "79"}'
    @reader.readConfig (error, config) ->
      expect(config).to.be.eql
        foo: 42
        bar: "79"
      done()

