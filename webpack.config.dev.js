const webpack = require('webpack');
const path = require('path');

const CopyPlugin = require('copy-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const Dotenv = require('dotenv-webpack');

const commonConfig = (entryPoint) => ({
    entry: `./src/${entryPoint}/index.ts`,
    resolve: {
        extensions: ['.ts', '.js']
    },
    module: {
        rules: [
            {
                include: [
                    path.resolve(__dirname, 'src', entryPoint, '*'),
                ],
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
            {
                include: [path.resolve(__dirname, 'src')],
                loader: 'babel-loader',

                options: {
                    plugins: [
                        'syntax-dynamic-import',
                    ],

                    presets: [
                        [
                            '@babel/preset-env',
                            {
                                modules: false,
                            },
                        ],
                    ],
                },

                test: /\.js$/,
            },
            {
                test: /\.(scss|css)$/,

                use: [
                    {
                        loader: 'style-loader',
                    },
                    {
                        loader: 'css-loader',
                    },
                    {
                        loader: 'sass-loader',
                    },
                ],
            },
        ],
    },

    output: {
        filename: 'bundle.js',
        path: path.join(__dirname, `./carbon/${entryPoint}/resources/js/`),
    },

    mode: process.env.NODE_ENV || 'development',

    plugins: [
        new CleanWebpackPlugin(),
        new webpack.BannerPlugin({
            banner: () => `F4ERP Copyright ${new Date().getFullYear()}`,
        }),
        new webpack.EnvironmentPlugin({}),
        new Dotenv(),
        new CopyPlugin([
            {
                from: path.join(__dirname, `src/${entryPoint}`),
                to: path.join(__dirname, `/carbon/${entryPoint}`),
                ignore: ['*.js', '*.ts', '*.scss'],
            },
        ]),
    ],

    optimization: {
        splitChunks: {
            cacheGroups: {
                vendors: {
                    priority: -10,
                    test: /[\\/]node_modules[\\/]/,
                },
            },

            chunks: 'async',
            minChunks: 1,
            minSize: 30000,
            name: true,
        },
        minimizer: [],
    },
});

module.exports = ['login', 'account', 'welcome', 'admin'].map(res => commonConfig(res));
