'use strict'
React = require 'react'
ReactDOM = require 'react-dom'
Main = require './main.cjsx'
injectTapEventPlugin = require 'react-tap-event-plugin'
injectTapEventPlugin()

ReactDOM.render <Main />, document.getElementById('main')
