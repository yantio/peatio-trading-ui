module ApplicationHelper

  def include_gon
    data = gon_variables || {}

    script = "<script>window.gon = {};"
    data.each do |key, val|
      script += "gon." + key.to_s + "=" + val.to_json + ";"
    end
    script += "</script>"
    script.html_safe
  end

  def gon_variables
   @response["gon_variables"]
  end

  def i18n_meta(key)
    t("#{i18n_controller_path}.#{action_name}.#{key}", default: :"layouts.meta.#{key}")
  end

  def i18n_controller_path
    @i18n_controller_path ||= controller_path.gsub(/\//, '.')
  end

  def body_id
    "#{controller_name}-#{action_name}"
  end

  def locale_name
    gon_variables["local"]
  end

  def funds_path
    "#{ENV["HOST"]}/funds"
  end

  def settings_path
    "#{ENV["HOST"]}/settings"
  end

  def order_history_path
    "#{ENV["HOST"]}/history/orders"
  end

  def signout_path
    "#{ENV["HOST"]}/signout"
  end

  def language_path(lang=nil)
    lang ||= I18n.locale
    asset_path("/languages/#{lang}.png")
  end

  def clear_market_order_bids_path market_id
    "#{ENV["HOST"]}/markets/#{market_id}/order_bids/clear"
  end

  def clear_market_order_asks_path market_id
    "#{ENV["HOST"]}/markets/#{market_id}/order_asks/clear"
  end

  def clear_market_orders_path market_id
    "#{ENV["HOST"]}/markets/#{market_id}/orders/clear"
  end

  def new_order_ask_path market_id
    "#{ENV["HOST"]}/markets/#{market_id}/order_asks"
  end

  def new_order_bid_path market_id
    "#{ENV["HOST"]}/markets/#{market_id}/order_bids"
  end

  def chat_feature
    @response["gon_variables"]["chat_feature"]
  end
end
