function calcularTotal()
{	var cupomNumero = document.getElementById("cupom").value;
	var total = document.getElementById("sub").value;
    var total2;
	
    
	total2 = total - 30;
	document.getElementById("total").value = total2.toFixed(2);
	alert(total2);
	
    /*else if(cupomNumero === "CT000000101" || cupomNumero2 === "CT000000101")
	{	total2 = total - 30;
		document.getElementById('total').value = total2.toFixed(2);
		alert("Desconto concedido! Pode finalizar a compra");
	}
	
    else if(cupomNumero2 === "CP000000102" || cupomNumero === "CP000000102")
	{	total2 = total - 10;
		document.getElementById('total').value = total2.toFixed(2);
		alert("Desconto concedido!");
	}*/
}
window.load = calcularTotal();