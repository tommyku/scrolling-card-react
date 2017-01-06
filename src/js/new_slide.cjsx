'use strict'
React = require 'react'
Slide = require './slide.cjsx'
Textarea = require('react-textarea-autosize').default
{grey500} = require 'material-ui/styles/colors'

class NewSlide extends React.Component
  @propTypes:
    onSubmit: React.PropTypes.func

  constructor: (props)->
    super props
    @state =
      inputId: "new-slide-input-#{(new Date).getTime()}"

  styles:
    inputStyle:
      outline: 'none'
      background: 'none'
      border: 'none'
      fontSize: '10vmin'

  placeholders: [
    'today I wanna...'
    'my goal is...'
    'really gotta do...'
    'let\'s get this shit done'
    'deadline... :|'
  ]

  randomPlaceholder: ->
    @placeholders[Math.floor(Math.random()*@placeholders.length)]

  keydownHandler: (event)->
    if event.key == 'Enter' && event.target.value.length > 0
      @props.onSubmit(event.target.value) if typeof @props.onSubmit == 'function'
      @refs.textarea.value = ''
      @refs.textarea.blur()

  render: ->
    <label htmlFor={@state.inputId} style={{display: 'block'}}>
      <Slide id='new'>
        <Textarea type='text'
          style={@styles.inputStyle}
          placeholder={@randomPlaceholder()}
          id={@state.inputId}
          ref='textarea'
          onKeyDown={@keydownHandler.bind(@)}>
        </Textarea>
      </Slide>
    </label>

module.exports = NewSlide
