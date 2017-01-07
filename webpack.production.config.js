webpack = require('webpack')

module.exports = {
  context: __dirname + '/src',
  entry: [
     __dirname + '/src/js/entry.cjsx'
  ],
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  output: {
    path: './',
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify('production')
      }
    }),
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.optimize.UglifyJsPlugin({
      compressor: {
        warnings: false
      }
    })
  ],
  module: {
    loaders: [
      { test: /\.css$/, loader: "style-loader!css-loader?importLoaders=1!postcss-loader" },
      { test: /\.scss$/, loader: "style-loader!css-loader?importLoaders=1!sass-loader!postcss-loader" },
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']}
    ]
  }
};
