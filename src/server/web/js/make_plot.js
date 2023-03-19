function WeatherLinePlot(
    {
        x_map = d => d.timestamp*1000,
        y_map = d => d.value,
        z_map = d => d.sensor_id,
        filter_func = (d,s) => (d.sensor_id==s),
        colour_map = "red",
        interpolation = d3.curveLinear
    } = {}
){
    return (data, div_id, _sensor_id, unit)=>{
        let plot = LinePlot(
            data.filter((d)=>filter_func(d,_sensor_id)),
            div_id,
            {
                x_map: x_map,
                y_map: y_map,
                z_map: z_map
            },
            {
                x_type: d3.scaleTime,
                y_label: UNIT_MAP[unit],
                x_label: "Time",
                width: 500,
                line_colour: colour_map,
                interpolation: interpolation
            }
        );

        plot.addFilteredData = function(_data){
            plot.addData(_data.filter((d)=>filter_func(d,_sensor_id)));
        };

        return plot;
    };
}


function plotRawRecords(range, on_request=()=>{}){
    on_request();

    let data = {
        "t2": Date.now()/1000,
        "t1": (Date.now()/1000) - 60*60*range
    };

    let plotter = WeatherLinePlot(
        y_map: (d) => normalise[d.sensor_id](d.value)
    );

    request(API_ROOT+"getBetween", "GET", data).then(
        (data) => {
            plotter(data, "plot_temperature", 13, "degree_c").drawData();
            plotter(data, "plot_pressure", 11, "Pa").drawData();
            plotter(data, "plot_humidity", 12, "%").drawData();
            on_request();
        }
    );
}


function plotMinMaxDaily(start, stop, on_request=()=>{}){
    on_request();

    let request_data = {
        "t2": stop/1000,
        "t1": start/1000,
        "period": 60*60*24
    };

    let plotter = WeatherLinePlot({
        z_map: d=>d.type,
        y_map: (d) => normalise[d.sensor_id](d.value),
        colour_map: {
            "min": "blue",
            "max": "red"
        },
        interpolation: d3.curveStep
    });

    let p_temp = plotter([], "plot_minmax_temperature", 13, "degree_c");
    let p_pres = plotter([], "plot_minmax_pressure", 11, "Pa");
    let p_hum = plotter([], "plot_minmax_humidity", 12, "%");

    request(API_ROOT+"getMaxBetween", "GET", request_data).then(
        (data) => {
            data.map(d => {
                d.type = "max";
                return d;
            });
            data.sort(
                (a, b) => {
                    return a.timestamp - b.timestamp;
                }
            );

            p_temp.addFilteredData(data);
            p_pres.addFilteredData(data);
            p_hum.addFilteredData(data);
            p_temp.drawData();
            p_pres.drawData();
            p_hum.drawData();
            on_request();
        }
    );

    request(API_ROOT+"getMinBetween", "GET", request_data).then(
        (data) => {
            data.map(d => {
                d.type = "min";
                return d;
            });
            data.sort(
                (a, b) => {
                    return a.timestamp - b.timestamp;
                }
            );

            p_temp.addFilteredData(data);
            p_pres.addFilteredData(data);
            p_hum.addFilteredData(data);
            p_temp.drawData();
            p_pres.drawData();
            p_hum.drawData();
            on_request();
        }
    );
}
