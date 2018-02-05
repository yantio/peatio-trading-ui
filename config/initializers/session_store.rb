# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_petio-trade_session'
Rails.application.config.session_store(
    :redis_store,
    key: '_peatio_session',
    expire_after: '60'.to_i.minutes
    )
