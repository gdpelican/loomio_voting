angular.module('loomioApp').directive 'proposalVoteOptions', ->
  scope: {vote: '='}
  restrict: 'E'
  templateUrl: 'generated/components/proposal_vote_options/proposal_vote_options.html'
  replace: true
