# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
path = require 'path'

oldWindowDimensions = {}

atom.commands.add 'atom-workspace', 'dot-atom:demo', ->
  console.log "Hello from dot-atom:demo"

atom.commands.add 'atom-workspace', 'custom:screenshot-prep': ->
  # 'custom:open-todo-list': ->
  #   todoList = path.join(process.env.HOME, 'Dropbox/todo/todo.txt')
  #   atom.workspace.open(todoList)
  oldWindowDimensions = atom.getWindowDimensions()
  atom.setWindowDimensions('width': 1366, 'height': 768)

atom.commands.add 'atom-workspace', 'custom:screenshot-restore': ->
  atom.setWindowDimensions(oldWindowDimensions)
