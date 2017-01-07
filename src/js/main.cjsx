'use strict'
require '../css/app.scss'
React = require 'react'
getMuiTheme = require('material-ui/styles/getMuiTheme').default
SwipeableViews = require('react-swipeable-views').default
TaskSlide = require './task_slide.cjsx'
NewSlide = require './new_slide.cjsx'
store = require 'store'
{AppBar, MuiThemeProvider, Snackbar,
 Drawer, MenuItem} = require 'material-ui'

class Main extends React.Component
  constructor: (props)->
    super props
    @state =
      tasks: store.get('work-la-7-head-react.tasks') || ['1', '2', '3']
      toastOpen: false
      contextMenu: false
      activeSlideIndex: 0
      toastText: ''

  addTask: (value)->
    tasks = @state.tasks
    tasks.push value
    @storeTasks()
    @setState {
      toastOpen: true
      tasks: tasks
      toastText: 'New task added'
    }

  removeTask: ()->
    index = @state.activeSlideIndex
    tasks = @state.tasks
    tasks.splice index, 1
    @storeTasks()
    @setState {
      toastOpen: true
      contextMenu: false
      tasks: tasks
      activeSlideIndex: Math.max(index - 1, 0)
      targetSlideIndex: Math.max(index - 1, 0)
      toastText: 'Task removed'
    }

  promoteTask: ()->
    index = @state.activeSlideIndex
    tasks = @state.tasks
    tasks.unshift(tasks.splice index, 1)
    @storeTasks()
    @setState {
      toastOpen: true
      contextMenu: false
      tasks: tasks
      activeSlideIndex: 0
      targetSlideIndex: 0
      toastText: 'Task promoted'
    }

  storeTasks: ->
    store.set 'work-la-7-head-react.tasks', @state.tasks

  handleSnackbarClose: ->
    @setState {toastOpen: false}

  handleSlideChange: (index)->
    @setState {
      activeSlideIndex: index
    }

  handleContextMenuChange: (open)->
    @setState {
      contextMenu: open
    }

  handleTransitionEnd: ->
    @setState =>
      {
        targetSlideIndex: @state.activeSlideIndex
      }

  render: ->
    <MuiThemeProvider muiTheme={getMuiTheme()}>
      <div>
        <Drawer
          docked={false}
          width={200}
          open={@state.contextMenu}
          disableSwipeToOpen={true}
          onRequestChange={@handleContextMenuChange.bind(@)}>
          <MenuItem onTouchTap={@promoteTask.bind(@)}>Promote</MenuItem>
          <MenuItem onTouchTap={@removeTask.bind(@)}>Remove</MenuItem>
        </Drawer>
        <SwipeableViews onChangeIndex={@handleSlideChange.bind(@)}
          onTransitionEnd={@handleTransitionEnd.bind(@)}
          index={@state.targetSlideIndex}>
          {
            for task, index in @state.tasks
              <TaskSlide key={index}
                onContextMenuChange={@handleContextMenuChange.bind(@)}
                position={index}
                id={"#{index}"}>
                {task}
              </TaskSlide>
          }
          <NewSlide onSubmit={@addTask.bind(@)} />
        </SwipeableViews>
        <Snackbar
          open={@state.toastOpen}
          message={@state.toastText}
          autoHideDuration={1500}
          onRequestClose={@handleSnackbarClose.bind(@)} />
      </div>
    </MuiThemeProvider>

module.exports = Main
