# frozen_string_literal: true

module ApplicationHelper
  def body_controller
    params[:controller].split('/')[0]
  end

  def modal(type, options = {}, &block)
    options = { size: options } if options.is_a? String
    defaults = { type: type, size: 'md', body: false, arrows: false }
    locals = defaults.merge options
    locals[:captured] = block_given? ? capture(&block) : ''
    render partial: 'partials/modal', locals: locals
  end
end
