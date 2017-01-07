'use strict'
React = require 'react'
TapAndPinchable = require 'react-tappable'
Slide = require './slide.cjsx'

class TaskSlide extends React.Component
  @propTypes:
    id: React.PropTypes.string.isRequired
    position: React.PropTypes.number.isRequired
    onContextMenuChange: React.PropTypes.func
    children: React.PropTypes.node

  handlePress: ->
    @props.onContextMenuChange(true) if typeof @props.onContextMenuChange == 'function'

  render: ->
    <div>
      <TapAndPinchable preventDefault={true}
        pressDelay={500}
        onPress={@handlePress.bind(@)}>
        <div className='animated infinite'>
          <Slide id={@props.id}>
            {@props.children}
          </Slide>
        </div>
      </TapAndPinchable>
    </div>

module.exports = TaskSlide
