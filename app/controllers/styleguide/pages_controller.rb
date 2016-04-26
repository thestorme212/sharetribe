class Styleguide::PagesController < ApplicationController
  include ReactOnRails::Controller
  layout "styleguide"

  before_action :data

  rescue_from ReactOnRails::PrerenderError do |err|
    Rails.logger.error(err.message)
    Rails.logger.error(err.backtrace.join("\n"))
    redirect_to styleguide_path,
                flash: { error: "Error prerendering in react_on_rails. See server logs." }
  end

  private

  def data
    # This is the props used by the React component.
    @app_props_server_render = {
      helloReduxData: {
        name: "Re Dux"
      }
    }

  end
end