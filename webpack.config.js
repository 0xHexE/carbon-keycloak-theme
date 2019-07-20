const devConfig = require('./webpack.config.dev');
const TerserPlugin = require('terser-webpack-plugin');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

for (const config of devConfig) {
  config.optimization.minimizer.push(new TerserPlugin());
  config.plugins.push(new UglifyJSPlugin());
}

module.exports = devConfig;
