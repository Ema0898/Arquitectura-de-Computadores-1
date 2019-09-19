let fileInput = $("#fileText");
let ripple = $(".lds-dual-ring");

fileInput.on('change', function(){
  let file = this.files[0];
  const reader = new FileReader();

  reader.onload = () => {
    fileInput.attr('disabled');
    ripple.show();
    let lines = processFile(reader.result);
    let binaryInstruction = compileISA(lines);
    ripple.hide();
    fileInput.removeAttr('disabled');
    console.log(binaryInstruction);
    if(binaryInstruction.includes(false)){
      M.toast({html: `Error en la instrucción ${binaryInstruction.indexOf(false) + 1} de ${file.name}`});
    } else {
      M.toast({html: `${file.name} compilado con éxito`});
      generateTxtFile(binaryInstruction);
    }
  }

  reader.readAsText(file);
});

const generateTxtFile = (compiledInstructions) => {
  let saveString = "";
  for (let i = 0; i < compiledInstructions.length; i++) {
    if (compiledInstructions[i] !== true && compiledInstructions[i] !== false) {
      saveString += compiledInstructions[i];
      if(i < compiledInstructions.length - 1) {
        saveString += "\r\n";
      }
    }
  }  
  var blob = new Blob([saveString], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "instructions.txt");
}