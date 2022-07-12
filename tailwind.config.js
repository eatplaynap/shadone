module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      'main': '#84C7BF',
      'sub': '#B32034'
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
