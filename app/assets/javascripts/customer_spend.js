$(document).on('ready page:load',function(){
  console.log("calling customer_spend.js");
  var width = 800,
     height = 580, 
     margin = 5;

  var colorScale = d3.scale.category10();

  var canvas = d3.select("#spend_this_month").append("svg")
                 .attr("width", width)
                 .attr("height", height)
                 .append("g")
                 .attr("transform","translate(50, 0)");

  var pack = d3.layout.pack()
                  .size([width, height - margin])
                  .padding(10);

  d3.json("/customer_spend_data.json",function(d) {

    var nodes = pack.nodes(d);
    console.dir(nodes);

    var node = canvas.selectAll(".node")
                     .data(nodes)
                     .enter()
                     .append("g")
                       .attr("class", "node")
                       .attr("transform", function (d){ return "translate(" + d.x + "," + d.y + ")"; } )

    node.append("circle")
        .attr("r", function (d){ return d.r; })
        .attr("fill", function (d){ return d.children ? "#fff" : colorScale(d.value) ; })
        .attr("opacity", "0.65")
        .attr("stroke", function (d){ return d.children ? "#fff" : colorScale(d.value) ; })
        .attr("stroke-width", "2");

    node.append("text")
        .text(function (d){ return d.children ? "" : d.name; })
        .attr("fill", "#000")
        .attr("x", 0)
        .attr("dy", ".15em")
        .attr("text-anchor", "middle")

    node.append("text")
        .text(function (d){ return d.children ? "" : d.value + "%" ; })
        .attr("fill", "#000")
        .attr("x", 0)
        .attr("dy", ".99em")
        .attr("text-anchor", "middle")
  });
});
