app.factory 'GithubFactory', ->
  githubusers = []

  @getGithubUsersСached = -> 
    if !githubusers or !githubusers.length 
      {}
    else githubusers   

  @setTitle = (_title) -> title = _title

  return this