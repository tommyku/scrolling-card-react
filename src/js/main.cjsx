'use strict'
require '../css/app.scss'
React = require 'react'
getMuiTheme = require('material-ui/styles/getMuiTheme').default
SwipeableViews = require('react-swipeable-views').default
Slide = require './slide.cjsx'
NewSlide = require './new_slide.cjsx'
store = require 'store'
{AppBar, MuiThemeProvider, Snackbar} = require 'material-ui'

class Main extends React.Component
  constructor: (props)->
    super props
    @state =
      tasks: store.get('work-la-7-head-react.tasks') || []
      toastOpen: false

  addTask: (value)->
    tasks = @state.tasks
    tasks.push value
    @storeTasks()
    @setState {
      toastOpen: true
      tasks: tasks
    }

  storeTasks: ->
    store.set 'work-la-7-head-react.tasks', @state.tasks

  handleSnackbarClose: ->
    @setState {toastOpen: false}

  render: ->
    <MuiThemeProvider muiTheme={getMuiTheme()}>
      <div>
        <SwipeableViews>
          {
            for task, index in @state.tasks
              <Slide key={index}
                id={"#{index}"}>
                {task}
              </Slide>
          }
          <NewSlide onSubmit={@addTask.bind(@)} />
        </SwipeableViews>
        <Snackbar
          open={@state.toastOpen}
          message='New task added'
          autoHideDuration={1500}
          onRequestClose={@handleSnackbarClose.bind(@)} />
      </div>
    </MuiThemeProvider>

module.exports = Main
