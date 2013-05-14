ConfigReader = require '../lib/config_reader'
expect = require 'expect.js'

describe 'ConfigReader', ->

  beforeEach ->
    @filenameRead = null
    @readFileError = null
    @readFileResult = "{}"
    fs =
      readFile: (filename, callback) =>
        @filenameRead = filename
        callback @readFileError, @readFileResult
    @reader = new ConfigReader fs

  it 'responds to readConfig', ->
    expect(@reader.readConfig).to.be.a Function

  it 'calls us back', (done) ->
    @reader.readConfig (config) ->
      done()

  it 'reads ~/.git-story', (done) ->
    @reader.readConfig (config) =>
      expect(@filenameRead).to.be process.env.HOME + '/.git-story'
      done()

  it 'parses and gives us back the config', (done) ->
    @readFileResult = '{"foo": 42, "bar": "79"}'
    @reader.readConfig (config) ->
      expect(config).to.be.eql
        foo: 42
        bar: "79"
      done()

  it 'gives us back an empty config when the file can\'t be read', (done) ->
    @readFileError = new Error
    @readFileResult = null
    @reader.readConfig (config) ->
      expect(config).to.be.eql {}
      done()

