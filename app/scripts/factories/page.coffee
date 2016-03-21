app.factory 'PageFactory', ->
  title = 'myApp'
  header = ''

  @getTitle = -> title

  @setTitle = (_title) -> title = _title

  @getHeader = -> header

  @setHeader = (_header) -> header = _header

  @getMain = => @ismain

  @setMain = (_ismain) => @ismain = _ismain

  return this
