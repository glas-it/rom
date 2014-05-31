function capitaliseFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}
/**
 * Create the data table
 */
Highcharts.drawTable = function() {

    moment.lang("es");
    var fechaInicio = moment(new Date($("#fechaInicio_year").val(), $("#fechaInicio_month").val() - 1));
    var fechaFin = moment(new Date($("#fechaFin_year").val(), $("#fechaFin_month").val() - 1));

    // user options
    var tableTop = 420,
        filtersTop = 50,
        colWidth = 150,
        tableLeft = document.getElementById("highcharts-report").offsetWidth / 2 - colWidth,
        rowHeight = 20,
        cellPadding = 2.5,
        valueDecimals = 2,
        valuePrefix = Highcharts.tableValuePrefix;

    // internal variables
    var chart = this,
        series = chart.series,
        renderer = chart.renderer,
        cellLeft = tableLeft;

    renderer.text(
        "Desde: " + capitaliseFirstLetter(fechaInicio.format("MMMM [de] YYYY")),
        tableLeft - 50,
        filtersTop + rowHeight
    )
    .css({
        fontSize: '15px'
    })
    .attr({
        align: 'left'
    })
    .add();

    renderer.text(
        "Hasta: " + capitaliseFirstLetter(fechaFin.format("MMMM [de] YYYY")),
        tableLeft + 350,
        filtersTop + rowHeight
    )
    .css({
        fontSize: '15px'
    })
    .attr({
        align: 'right'
    })
    .add();

    renderer.text(
        Highcharts.xTitle,
        cellLeft + colWidth / 2,
        tableTop + rowHeight
    )
    .css({
        fontWeight: 'bold',
        fontSize: '20px'
    })
    .attr({
        align: 'center'
    })
    .add();

    $.each(series, function(i, serie) {
        cellLeft += colWidth;

        // Apply the cell text
        renderer.text(
                Highcharts.yTitle,
                cellLeft + colWidth / 2,
                tableTop + rowHeight
            )
            .attr({
                align: 'center'
            })
            .css({
                fontWeight: 'bold',
                fontSize: "20px"
            })
            .add();

        $.each(serie.data, function(row, point) {

              // Apply the cell text
            renderer.text(
                point.name,
                cellLeft - colWidth + cellPadding,
                tableTop + (row + 2) * rowHeight - cellPadding
            )
            .attr({
                align: 'left'
            })
            .add();

            // Apply the cell text
            renderer.text(
                    valuePrefix + Highcharts.numberFormat(point.y, valueDecimals),
                    cellLeft + colWidth - cellPadding,
                    tableTop + (row + 2) * rowHeight - cellPadding
                )
                .attr({
                    align: 'right'
                })
                .add();

            // horizontal lines
            if (row == 0) {
                Highcharts.tableLine( // top
                    renderer,
                    tableLeft,
                    tableTop + cellPadding,
                    cellLeft + colWidth,
                    tableTop + cellPadding
                );
                Highcharts.tableLine( // bottom
                    renderer,
                    tableLeft,
                    tableTop + (serie.data.length + 1) * rowHeight + cellPadding,
                    cellLeft + colWidth,
                    tableTop + (serie.data.length + 1) * rowHeight + cellPadding
                );
            }
            // horizontal line
            Highcharts.tableLine(
                renderer,
                tableLeft,
                tableTop + row * rowHeight + rowHeight + cellPadding,
                cellLeft + colWidth,
                tableTop + row * rowHeight + rowHeight + cellPadding
            );

        });

        // vertical lines
        if (i == 0) { // left table border
            Highcharts.tableLine(
                renderer,
                tableLeft,
                tableTop + cellPadding,
                tableLeft,
                tableTop + (serie.data.length + 1) * rowHeight + cellPadding
            );
        }

        Highcharts.tableLine(
            renderer,
            cellLeft,
            tableTop + cellPadding,
            cellLeft,
            tableTop + (serie.data.length + 1) * rowHeight + cellPadding
        );

        if (i == series.length - 1) { // right table border

            Highcharts.tableLine(
                renderer,
                cellLeft + colWidth,
                tableTop + cellPadding,
                cellLeft + colWidth,
                tableTop + (serie.data.length + 1) * rowHeight + cellPadding
            );
        }

    });


};

/**
 * Draw a single line in the table
 */
Highcharts.tableLine = function (renderer, x1, y1, x2, y2) {
    renderer.path(['M', x1, y1, 'L', x2, y2])
        .attr({
            'stroke': 'silver',
            'stroke-width': 1
        })
        .add();
};