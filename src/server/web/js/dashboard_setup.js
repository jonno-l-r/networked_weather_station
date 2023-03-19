// Generate callback function
// to signal completed request
// and update status field
function getOnRequest(num_calls, status){
    let requests = 0;

    return ()=>{
        if (requests == num_calls){
            status.innerText = "Done";
            status.style.background = "cyan";
            requests = 0;
        }
        else {
            status.innerText = "Loading";
            status.style.background = "orange";
            ++requests;
        }
    };    
}


// Minimize / maximize display widgets
(() => {
    const collapse = document.getElementsByClassName("collapse");

    for (let e of collapse){
        e.onclick = () => {
            let display = e.parentElement
                .parentElement
                .getElementsByClassName("display")[0];

            if (display.style.display == "none"){
                display.style.display = "block";
                e.innerText = "\u2014";
            }
            else {
                display.style.display = "none";
                e.innerText = "+";
            }
        }
    }
})();


// Plot range callbacks
(()=>{
    const range = document.getElementById("range");
    const status = document.getElementById("status_raw");
    const _on_request = getOnRequest(1, status);

    range.onchange = () => {
        plotRawRecords(
            range.value,
            on_request=_on_request
        );
    };

    plotRawRecords(
        range.value,
        on_request=_on_request
    );
})();


// Minmax plot callbacks
(()=>{
    const start = document.getElementById("minmax_start");
    const stop = document.getElementById("minmax_stop");
    const status = document.getElementById("status_minmax");
    const _on_request = getOnRequest(2, status);

    stop.valueAsNumber = Date.now();
    start.valueAsNumber = Date.now() - 1000*60*60*24*7;

    start.onchange = () => {
        plotMinMaxDaily(
            start.valueAsNumber,
            stop.valueAsNumber,
            on_request = _on_request
        );
    };

    stop.onchange = () => {
        plotMinMaxDaily(
            start.valueAsNumber,
            stop.valueAsNumber,
            on_request = _on_request            
        );
    };

    plotMinMaxDaily(
        start.valueAsNumber,
        stop.valueAsNumber,
        on_request = _on_request        
    );
})();
