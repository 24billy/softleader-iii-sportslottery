<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>


<script src="http://code.highcharts.com/modules/data.js"></script>
<script src="http://code.highcharts.com/modules/drilldown.js"></script>
</head>
<body>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<!-- Data from www.netmarketshare.com. Select Browsers => Desktop share by version. Download as tsv. -->
<pre id="tsv" style="display:none">Browser Version	Total Market Share

Lamigo桃猿  1	8.01%
Lamigo桃猿  2	8.01%
Lamigo桃猿  3	8.01%
Lamigo桃猿  4	7.73%
Lamigo桃猿  5	1.13%
Lamigo桃猿  6	0.90%
Lamigo桃猿  7	0.85%
Lamigo桃猿  8	0.65%
統一獅  1	6.72%
統一獅  2	6.40%
統一獅  3	4.72%
統一獅  4	3.55%
統一獅  5	3.53%
統一獅  6	2.16%
統一獅  7	1.87%
統一獅  8	1.30%
義大犀牛 1	0.55%
義大犀牛 2	0.50%
義大犀牛 3	0.45%
義大犀牛 4	0.36%
義大犀牛 5	0.36%
義大犀牛 6	0.32%
義大犀牛 7	0.31%
義大犀牛 8	0.29%
中信兄弟 1	0.29%
中信兄弟 2 	0.26%
中信兄弟 3 	0.25%
中信兄弟 4	0.24%
中信兄弟 5 	0.18%
中信兄弟 6 	0.16%
中信兄弟 7 	0.15%
中信兄弟 8	0.14%
中信兄弟 13.0	0.13%
</pre>


<script>
$(function () {

    Highcharts.data({
        csv: document.getElementById('tsv').innerHTML,
        itemDelimiter: '\t',
        parsed: function (columns) {

            var brands = {},
                brandsData = [],
                versions = {},
                drilldownSeries = [];

            // Parse percentage strings
            columns[1] = $.map(columns[1], function (value) {
                if (value.indexOf('%') === value.length - 1) {
                    value = parseFloat(value);
                }
                return value;
            });

            $.each(columns[0], function (i, name) {
                var brand,
                    version;

                if (i > 0) {

                    // Remove special edition notes
                    name = name.split(' -')[0];

                    // Split into brand and version
                    version = name.match(/([0-9])/);
                    if (version) {
                        version = version[0];
                    }
                    brand = name.replace(version, '');

                    // Create the main data
                    if (!brands[brand]) {
                        brands[brand] = columns[1][i];
                    } else {
                        brands[brand] += columns[1][i];
                    }

                    // Create the version data
                    if (version !== null) {
                        if (!versions[brand]) {
                            versions[brand] = [];
                        }
                        if(version == 1){
                        	versions[brand].push(['主隊不讓分', columns[1][i]]);
                        }else if(version == 2){
                        	versions[brand].push(['客隊不讓分', columns[1][i]]);
                        }else if(version == 3){
                        	versions[brand].push(['主隊讓分', columns[1][i]]);
                        }else if(version == 4){
                        	versions[brand].push(['客隊讓分', columns[1][i]]);
                        }else if(version == 5){
                        	versions[brand].push(['高於總和', columns[1][i]]);
                        }else if(version == 6){
                        	versions[brand].push(['低於總和', columns[1][i]]);
                        }else if(version == 7){
                        	versions[brand].push(['總分奇數', columns[1][i]]);
                        }else if(version == 8){
                        	versions[brand].push(['低於總和', columns[1][i]]);
                        }
                       
                    }
                }

            });

            $.each(brands, function (name, y) {
                brandsData.push({
                    name: name,
                    y: y,
                    drilldown: versions[name] ? name : null
                });
            });
            $.each(versions, function (key, value) {
                drilldownSeries.push({
                    name: key,
                    id: key,
                    data: value
                });
            });

            // Create the chart
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '過關比例統計, 2014'
                },
                subtitle: {
                    text: '點擊長柱見投注細節<br>計算方式:每種投注方式的過關數除以總投注數除以出賽場次'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: '過關數比例'
                    }
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            format: '{point.y:.1f}%'
                        }
                    }
                },

                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                },

                series: [{
                    name: '隊名',
                    colorByPoint: true,
                    data: brandsData
                }],
                drilldown: {
                    series: drilldownSeries
                }
            });
        }
    });
});
</script>





</body>
</html>