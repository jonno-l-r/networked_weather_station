function LinePlot(
    data,
    id,
    {
        x_map = i=>{},
        y_map = i=>{},
        z_map = i=>1
    }={},
    {
        margin_top = 50,
        margin_bottom = 50,
        margin_right = 20,
        margin_left = 60,
        width=400,
        height=375,
        y_label,
        x_label,
        line_width = 2,
        line_colour = "red",
        x_type = d3.scaleLinear,
        y_type = d3.scaleLinear,
        interpolation = d3.curveNatural
    }={}
){
    return {
        data: data,
        div: "#"+id,

        addData: function(_data){
            this.data = this.data.concat(_data);
        },

        clearData: function(){
            this.data = [];
        },

        _mapLineColour: (typeof line_colour)==="object" ?
            ([d])=>line_colour[z_map(d)] :
            ()=>line_colour,

        _setScales: function(){
            this.svg = d3.select(this.div)
                .attr("viewBox", "0 0 " + width + " " + height)
                .attr("preserveAspectRatio", "xMidYMid meet");

            this.x = this.data.map(x_map);
            this.y = this.data.map(y_map);

            let x_range = [margin_left, width-margin_right];
            let y_range = [margin_top, height-margin_bottom];

            x_domain = d3.extent(this.x);
            y_domain = d3.extent(this.y).reverse();

            this.x_scale = x_type(x_domain, x_range);
            this.y_scale = y_type(y_domain, y_range);

            this.x_axis = d3.axisBottom(this.x_scale)
                  .ticks(width/85)
                  .tickSizeOuter(0);
            this.y_axis = d3.axisLeft(this.y_scale)
                  .ticks(height/80);

            this.line = d3.line()
                  .curve(interpolation)
                  .x(d => this.x_scale(x_map(d)))
                  .y(d => this.y_scale(y_map(d)));
        },

        _drawAxis: function(){
            this.svg.selectAll('g').remove();
            this.svg.append("g")
                .attr("transform", `translate(0, ${height - margin_bottom})`)
                .call(this.x_axis)
                .call(
                    g => g.append("text")
                        .attr("y", margin_bottom-10)
                        .attr("x", width/2)
                        .attr("text-anchor", "start")
                        .attr("fill", "currentColor")
                        .text(x_label)
                );

            this.svg.append("g")
                .attr("transform", `translate(${margin_left}, 0)`)
                .call(this.y_axis)
                .call(
                    g => g.selectAll(".tick line").clone()
                        .attr("x2", width - margin_left - margin_right)
                        .attr("stroke-opacity", 0.1)
                )
                .call(
                    g => g.append("text")
                        .attr("x", -margin_left)
                        .attr("y", margin_top-10)
                        .attr("text-anchor", "start")
                        .attr("fill", "currentColor")
                        .text(y_label)
                );            
        },

        drawData: function(){
            this._setScales();
            this._drawAxis();

            d3.select(this.div)
                .append("g")               
                .selectAll("path")
                .data([...d3.group(this.data, z_map)].map(i=>i[1]))
                .join(
                    enter => enter
                        .append("path")
                        .attr("class", "line")
                        .transition().duration(200)
                        .attr("stroke-opacity", 1)
                        .selection(),
                    update => update,
                    exit => exit.remove()
                )
                .attr("d", this.line)
                .attr("fill", "none")
                .attr("stroke", this._mapLineColour)
                .attr("stroke-width", line_width);
        }
    };
}
