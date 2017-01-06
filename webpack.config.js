module.exports = {
  context: __dirname + '/src',
  entry: [
    "webpack-dev-server/client?http://0.0.0.0:8080",
    'webpack/hot/only-dev-server',
     __dirname + '/src/js/entry.cjsx'
  ],
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  output: {
    path: 'output',
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module: {
    loaders: [
      { test: /\.scss$/, loader: "style-loader!css-loader?importLoaders=1!sass-loader!postcss-loader" },
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']}
    ]
  }
};
