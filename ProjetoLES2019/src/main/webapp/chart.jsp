<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>An�lise</h2>
<script type="text/javascript" src="https://www.chartjs.org/dist/2.9.2/Chart.bundle.min.js" ></script>
<script type="text/javascript" src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
grafico: <select id="queen" onchange="maggots();">
    <option selected="selected" value="0">bagagem</option>
    <option value="1">passageiros</option>
</select>
tipo: <select id="mmrdevill" onchange="maggots();">
    <option selected="selected" value="0">linha</option>
    <option value="1">barra</option>
</select>
voo: <select id="mmrdevil" onchange="maggots();">
    <option selected="selected" value="0">todos</option>
    <option value="1">GRU To DCM</option>
    <option value="2">BSB To GRU</option>
    <option value="3">GRU To BSB</option>
</select>
    M�s inicial:
<select id="mrdevil" onchange="maggots();">
    <option selected="selected">1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
    <option>6</option>
    <option>7</option>
    <option>8</option>
    <option>9</option>
    <option>10</option>
    <option>11</option>
    <option>12</option>
</select> ano inicial:
<select id="mrdevill" onchange="maggots();">
    <option selected="selected">2017</option>
    <option>2018</option>
</select> M�s final:
<select id="devil" onchange="maggots();">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
    <option>6</option>
    <option>7</option>
    <option>8</option>
    <option>9</option>
    <option selected="selected">10</option>
    <option>11</option>
    <option>12</option>
</select>
    ano final:
<select id="mrdevilll" onchange="maggots();">
    <option>2017</option>
    <option selected="selected">2018</option>
</select>
<br />
<div class="chart-container" style="position: relative; height:400px; width:800px">
    <canvas id="myChart"></canvas>
</div>
<script>
    var asdf;

    function maggots() {
        asdf.destroy();
        var ctx = document.getElementById('myChart').getContext('2d');
        var e = document.getElementById("devil");
        var strUser = e.options[e.selectedIndex].value;
        var ee = document.getElementById("mrdevil");
        var strUserr = ee.options[ee.selectedIndex].value;
        var eer = document.getElementById("mrdevill");
        var strUserre = eer.options[eer.selectedIndex].value;
        var eerr = document.getElementById("mrdevilll");
        var strUserree = eerr.options[eerr.selectedIndex].value;
        var eee = document.getElementById("mmrdevil");
        var strUserrr = eee.options[eee.selectedIndex].value;
        var eeee = document.getElementById("mmrdevill");
        var sstrUserrr = eeee.options[eeee.selectedIndex].value;
        var eeeeu = document.getElementById("queen");
        var loml = eeeeu.options[eeeeu.selectedIndex].value;
        asdf = new Chart(ctx, JSON.parse(httpGet('./api/devil/analise/' + sstrUserrr + '/' + strUserree + '/' + strUser + '/' + strUserre + '/' + strUserr + '/' + strUserrr + '/' + loml )));
    }
    function httpGet(theUrl) {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("GET", theUrl, false); // false for synchronous request
        xmlHttp.send(null);
        return xmlHttp.responseText;
    }

    window.onload = function () {
        var ctx = document.getElementById('myChart').getContext('2d');
        console.log(httpGet('/ProjetoLES2019/api.jsp'));
        asdf = new Chart(ctx, JSON.parse(httpGet('/ProjetoLES2019/api.jsp')));
    };
</script>
</body>
</html>