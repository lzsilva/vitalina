function validaFormNome(){	
	
	$.validator.addMethod("valueNotEquals", function(value, element, arg){
	   	  return arg != value;
	   	 }, "<font color='red'> Valor Incorreto </font>");
	 
    $(" #empresa, #linha, #localidade, #itinerario ").validate({
        rules:{
            nome:{
                required: true,
                minlength: 4,
                maxlength: 50
            },
            empresa: { valueNotEquals: "default" },
            tipo: { valueNotEquals: "default" },
            localidade: { valueNotEquals: "default" },
            linha: { valueNotEquals: "default" },
            ordem: {
            	required: true,
            	number: true
            }
        },
        messages:{
            nome:{
                required: "<font color='red'>O campo nao pode estar vazio!</font>",
                minlength: "<font color='red'>No minimo 4 letras!</font>",
                maxlength: "<font color='red'>No maximo 50 letras!</font>"
            },
            empresa: { valueNotEquals: "<font color='red'> Selecione um item. </font>" },
            tipo: { valueNotEquals: "<font color='red'> Selecione um item. </font>" },
            localidade: { valueNotEquals: "<font color='red'> Selecione um item. </font>" },
            linha: { valueNotEquals: "<font color='red'> Selecione um item! </font>" },
            ordem:{
            	required: "<font color='red'> O campo nao pode estar vazio! </font>",
            	number: "<font color='red'> Este campo &eacute num&eacuterico! </font>"
            }
        }
    });     
   
}

$(document).ready(function(){
    
	validaFormNome();
	
});