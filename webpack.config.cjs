const path = require('path');

module.exports = {
  entry: './src/Counter.bs.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
  mode: 'development',
  devtool: 'source-map',
  devServer: {
    static: {
      directory: path.join(__dirname, '.'),
    },
    hot: true,
  },
  resolve: {
    extensions: ['.js']
  }
};