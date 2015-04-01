var http = require("http");
var mongo = require("mongojs");

var db = mongo.connect("database", ["users"]);

http.createServer(function(req, res) {

  db.users.find(function(err, users) {
    if(err) { throw err; }

    res.writeHead(200, {"Content-Type": "text/html"});
    res.write("<table>");
    res.write("<td> Hi, we fund a lot of buglione here... </td>");

    users.forEach(function(user) {
      res.write("<tr>");
      res.write("<td>" + user.name+ "</td>");
      res.write("<td>" + user.last_name+ "</td>");
      res.write("</tr>");
    });

    res.end("</table>");
  });

}).listen(8080);

