angular.module('loomioApp').directive 'loomioProposal', ->
  scope: {proposal: '='}
  restrict: 'E'
  templateUrl: 'generated/components/loomio_proposal/loomio_proposal.html'
  replace: true
  controller: ($scope, Records, Session, ModalService, VoteForm, AbilityService) ->

    $scope.undecidedPanelOpen = false

    $scope.changeVote = ->
      ModalService.open VoteForm, vote: -> $scope.proposal.lastVoteByUser(Session.user()).clone()

    sortValueForVote = (vote) ->
      positionValues = {yes: 1, abstain: 2, no: 3, block: 4}
      if $scope.voteIsMine(vote)
        0
      else
        positionValues[vote.stance.position]

    $scope.curatedVotes = ->
      _.sortBy $scope.proposal.uniqueVotes(), (vote) ->
        sortValueForVote(vote)

    $scope.voteIsMine = (vote) ->
      vote.authorId == Session.user().id

    $scope.showChangeVoteOption = (vote) ->
      AbilityService.canVoteOn($scope.proposal) and $scope.voteIsMine(vote)

    $scope.showUndecided = ->
      $scope.undecidedPanelOpen = true

    $scope.showPositionButtons = ->
      AbilityService.canVoteOn($scope.proposal) and $scope.undecided()

    $scope.undecided = ->
      !($scope.proposal.lastVoteByUser(Session.user())?)

    $scope.$on 'triggerVoteForm', (event, position) ->
      myVote = $scope.proposal.lastVoteByUser(Session.user()) or {}
      $scope.select position, myVote.statement

    $scope.select = (position) ->
      ModalService.open(VoteForm, vote: -> Records.votes.build(proposalId: $scope.proposal.id, stance: {position: position}))
