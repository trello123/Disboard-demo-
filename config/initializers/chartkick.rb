Chartkick.options = {
  width: "500px",
  height: "300px",
  empty: "No data",
  adapter: "highcharts",
  legend: false,
  library: {
    chart: {
      borderColor: '#fff',
      borderWidth: 3,
      borderRadius: '5',
      spacing: [20, 30, 20, 30],
      style: {
        fontSize: '24px'
      },
      shadow: {
          color: '#ddd',
          width: 3,
          offsetX: 1,
          offsetY: 1
        },
        plotOptions: {
        series: {
          shadow: true
        }
      }
    }
  }
}