# Be sure to restart your server when you modify this file.

ApplicationController.renderer.defaults.merge!(
  http_host: Figaro.env.default_host,
  https: !Rails.env.development?
)
