'use strict'
React = require 'react'
{grey900} = require 'material-ui/styles/colors'
randomColor = require 'randomcolor'

class Slide extends React.Component
  @propTypes:
    id: React.PropTypes.string.isRequired
    children: React.PropTypes.node.isRequired

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
        color: grey900
        backgroundColor: randomColor {luminosity: 'light'}
      }
    )

  render: ->
    <div style={@slideStyle()} id={"slide-#{@props.id}"}>
      {@props.children}
    </div>

module.exports = Slide
