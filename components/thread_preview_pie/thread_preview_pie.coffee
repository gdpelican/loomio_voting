angular.module('loomioApp').directive 'threadPreviewPie', ->
  scope: {proposal: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_preview_pie/thread_preview_pie.html'
  replace: true
  controller: ($scope, Session) ->

    $scope.vote = ->
      $scope.proposal.lastVoteByUser(Session.user())

    $scope.translationData = (thread) ->
      position: $scope.vote().stance.position

    return
