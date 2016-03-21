app.factory 'PageFactory', ->
  title = 'myApp'
  header = ''

  @getTitle = -> title

  @setTitle = (_title) -> title = _title

  @getHeader = -> header

  @setHeader = (_header) -> header = _header

  @getMain = -> 0

  return this
