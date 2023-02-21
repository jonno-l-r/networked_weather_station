const API_ROOT = "../php/main.php/sensors/";
const UNIT_MAP = {
    "degree_c": '\u2103',
    "%": "%",
    "Pa": "Pa"
};
const SENSOR_WHITELIST = [
    "11",
    "12",
    "13"
];


function getDateString(timestamp_secs){
    return (
        new Date(timestamp_secs*1000)
    ).toLocaleString();
}


function getLastMidnight(){
    let d = new Date();
    return (
        new Date(
            d.getFullYear(),
            d.getMonth(),
            d.getDate(),
            0, 0, 0)
    ).valueOf() / 1000;
}


function unique(data){
    let ids = {};
    temp = data.filter(
        (d) => {
            if (d.sensor_id in ids){
                return false;
            }
            else {
                ids[d.sensor_id] = true;
                return true;
            }
        }
    );

    return temp;
}


function makeColumn(data, name){
    let label = document.createElement("th");
    label.appendChild(
        document.createTextNode(name)
    );
    document.getElementById("labels").appendChild(label);

    for (sensor of data){
        if (SENSOR_WHITELIST.includes(sensor.sensor_id)) {
            let row = document.getElementById(sensor.measurement);
            let data_cell = document.createElement("td");

            data_cell.appendChild(
                document.createTextNode(
                    `${sensor.value} ${UNIT_MAP[sensor.unit]}`
                )
            );

            row.appendChild(data_cell);
        }
    }
}


// Get latest conditions and populate
// summary table
request(API_ROOT+"getLatest", "GET").then(
    (data) => {
        let date = document.getElementById("timestamp");
        date.appendChild(
            document.createTextNode(
                getDateString(data[0].timestamp)
            )
        );

        makeColumn(data, "Current");
    }
);


// Get today's maximum,
// so far
var data = {
    "t2": Date.now()/1000,
    "t1": getLastMidnight()
};
request(API_ROOT+"getMaxBetween", "GET", data=data).then(
    (data) => {
        makeColumn(
            unique(data),
            "Maximum"
        );
    }
);


// Get today's minimum,
// so far
request(API_ROOT+"getMinBetween", "GET", data=data).then(
    (data) => {
        makeColumn(
            unique(data),
            "Minimum"
        );
    }
);
