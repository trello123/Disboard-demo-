Chartkick.options = {
  width: "544px",
  height: "300px",
  empty: "沒有資料",
  adapter: "highcharts",
  library: {
    chart: {
      borderColor: '#fff',
      borderWidth: 3,
      borderRadius: '5',
      spacing: [20, 30, 20, 30],
      title: {
        style: {
          spacingRight: 30
        }
      },
      style: {
        fontSize: '20px',
        fontWeight: 'normal'
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