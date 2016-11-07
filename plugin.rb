module Plugins
  module LoomioVoting
    class Plugin < Plugins::Base
      setup! :loomio_voting do |plugin|
        plugin.enabled = true
        plugin.register_proposal_kind :loomio, expanded: :proposal_expanded, collapsed: :proposal_collapsed
        plugin.use_component :proposal_positions_panel
        plugin.use_component :position_buttons_panel
      end
    end
  end
end
