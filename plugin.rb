module Plugins
  module LoomioVoting
    class Plugin < Plugins::Base
      setup! :loomio_voting do |plugin|
        plugin.enabled = true
        plugin.use_class 'app/models/votes/loomio'
        plugin.register_proposal_kind :loomio,
          expanded:        :proposal_expanded,
          collapsed:       :proposal_collapsed,
          vote_form:       :proposal_vote_options,
          preview_large:   :thread_preview_pie,
          preview_small:   :pie_chart
        plugin.use_component :proposal_positions_panel
        plugin.use_component :position_buttons_panel
      end
    end
  end
end
