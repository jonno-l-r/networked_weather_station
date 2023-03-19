function request(url, method, data = {}){
    let params = "/?";
    for (let key in data){
        params = params +
            key + "=" + data[key] + "&";
    }
    url = url + params;

    return new Promise(
        (resolve, reject) => {
            const h = new XMLHttpRequest();
            h.open(method, url, true);
            h.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            h.onload = function() {
                if (h.status >= 200 && h.status < 300){
                    resolve(
                        JSON.parse(this.responseText)
                    );
                }
                else {
                    reject(h.status);
                }
            };
            h.send();
        });
}
