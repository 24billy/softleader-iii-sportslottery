<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<div id="tsv" style="display:none">Browser Version	Total Market Share
2014年7月 1	8.01%
2014年7月 2	8.01%
2014年7月 3	8.01%
2014年7月 4	7.73%
2014年7月 5	8.01%
2014年7月 6	8.01%
2014年7月 7	8.01%
2014年7月 8	7.73%
2014年8月 1	1.13%
2014年8月 2	0.90%
2014年8月 3	0.85%
2014年8月 4	0.65%
2014年8月 5	0.85%
2014年8月 6	0.85%
2014年8月 7	0.85%
2014年8月 8	0.85%
</div>



<script>
$(function () {

	var col = [];
	col[0] = [];
	col[1] = [];
	$.each($('#tsv').text().split('\n'), function(index, row){
		console.log(row);
		coldata = row.split('\t');
		if(coldata[0]){
			col[0].push(coldata[0]);
			col[1].push(coldata[1]);
		}
	});
	
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

            $.each(col[0], function (i, name) {
                var brand,
                    version;

                console.log(name);

                if (i > 0) {

                    // Remove special edition notes

                   // name = name.split(' -')[0];

                    console.log(name);

                    // Split into brand and version
                    version = name.match(/( [0-9])/);
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