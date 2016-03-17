# usage: <img ng-src="src" image-onload="imgLoadedCallback()"

app.directive 'imageOnload', ->
  restrict: 'A',
  link: (scope, element, attrs) ->
    element.bind 'load', ->
      scope.$apply(attrs.imageOnload)
