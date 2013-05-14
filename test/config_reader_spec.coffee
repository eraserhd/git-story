ConfigReader = require '../lib/config_reader'
expect = require 'expect.js'

describe ConfigReader, ->

  beforeEach ->
    @reader = new ConfigReader

  it 'responds to readConfig', ->
    expect(@reader.readConfig).to.be.a Function

