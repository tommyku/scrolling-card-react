'use strict'
React = require 'react'
{grey100} = require 'material-ui/styles/colors'
randomColor = require 'randomcolor'

class Slide extends React.Component
  @propTypes:
    id: React.PropTypes.string.isRequired
    children: React.PropTypes.node.isRequired

  HUES: ['red', 'orange', 'yellow', 'green', 'blue', 'purple']

  constructor: (props)->
    super props
    hue = @HUES[Math.floor(Math.random()*@HUES.length)]
    @state =
      backgroundColor: randomColor {luminosity: 'dark', hue: hue, alpha: 0.9}
      color: randomColor {luminosity: 'light', hue: hue, alpha: 0.2}

  styles:
    slide:
      fontFamily: 'sans-serif'
      fontWeight: 300
      fontSize: '10vmin'
      height: '100vh'
      maxHeight: '100vh'
      overflowY: 'auto'
      padding: '0 32'
      display: 'flex'
      flexDirection: 'column'
      justifyContent: 'center'

  slideStyle: ->
    Object.assign(
      {},
      @styles.slide,
      {
        color: @state.color
        backgroundColor: @state.backgroundColor
      }
    )

  render: ->
    <div style={@slideStyle()} id={"slide-#{@props.id}"}>
      {@props.children}
    </div>

module.exports = Slide
