const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
          'Azure-blue-9': '#414E92',
          'Azure-blue-8': '#414E92',
          'Azure-blue-7': '#414E92',
          'Azure-blue-6': '#34406D',
          'Azure-blue': '#414E92',
          'Azure-blue-5': '#6871B1',
          'Azure-blue-4': '#5965A3',
          'Azure-blue-3': '#7A84C9',
          'Azure-blue-2': '#515D8E',
          'Azure-blue-1': '#6E78A7',
          'my-blue': '#2196f3',
          'white-1':'#f5f5f5'
      },
      boxShadow: {
        '3xl': '30px 0x 0px 0px rgba(0, 0, 0, 0.3)',
        '4xl': 'rgb(38, 57, 77) -20px 20px 30px 0px;',
        '5xl': 'rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require("daisyui"),
    
  ],
  daisyui: {
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "light",
  },  
}
