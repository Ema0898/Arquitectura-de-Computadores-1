const processFile = (file) => {
  let processArray = file.split('\n').filter(function(value, index, arr){
    return value !== "" && value !== "\r";
  });

  processArray = processArray.map((element) => {
    return element.split(" ").filter((val, index, arr) => {
      return val !== "";
    });
  });

  processArray = processArray.map((element) => {
    return element.map((element) => {
      if(element.substr(-1) === ","){
        return element.substr(0, element.length - 1).toLowerCase();
      } else {
        return element.toLowerCase();
      }
    });
  });

  processArray = processArray.map((element) => {
    return element.map((element) => {
      if(element.substr(-1) === "\r"){
        return element.substr(0, element.length - 1);
      } else {
        return element;
      }
    });
  });

  return processArray;
};

const getAllLabels = (arrayToCheck) => {
  let branches = {};
  arrayToCheck.map((value, index, array) => { 
    let checkIfLabel = value[0];
    if(checkIfLabel.substr(-1) === ":") {
      branches[checkIfLabel] = index + 1 - Object.keys(branches).length;
    }
  });
  return branches;
}

const fillBits = (string, bitAmount) => {
  let bitsToInsert = bitAmount - string.length;
  let insertBits = "";
  if(bitsToInsert > 0){
    for (let i = 0; i < bitsToInsert; i++){
      insertBits += "0";
    }
  }
  return insertBits + string;
}

const twosComplement = (binaryString) => {
  let newString = "";
  for (let i = 0; i < binaryString.length; i++) {
    if (binaryString[i] === "1") {
      newString += "0";
    } else {
      newString += "1";
    }
  }
  return fillBits((parseInt(newString, 2) + 1).toString(2), 7);
}

const registerToBin = reg => {
  let regNum = reg.substr(1, reg.length)
  if(+regNum || regNum === "0") {
    if(regNum > 10) {
      return false;
    } else {
      return fillBits((+regNum).toString(2), 4);
    }
  } else {
    return false;
  }
}

const sumProcess = (array, cond) => {
  let cmd = "00";
  let op = "00";
  let s = "0";
  let I = "0";
  if (array.length !== 4) {
    return false;
  } else {
    rd = registerToBin(array[1]);
    operand1 = array[2];
    operand2 = array[3];
    if ((+operand1 || operand1 === "0") && (+operand2 || operand2 === "0")) {
      return false;
    } else {
      if (+operand1 || operand1 === "0") {
        rn = operand2;
        I = "1";
        src2 = fillBits((+operand1).toString(2), 7);
      } else if (+operand2 || operand2 === "0") {
        rn = operand1;
        I = "1";
        src2 = fillBits((+operand2).toString(2), 7);
      } else {
        rn = operand1;
        src2 = registerToBin(operand2);
        src2 += "000";
      }
    }
  }
  rn = registerToBin(rn);
  if ((!src2 && src2 !== "0000000") || !rn || !rd) {
    return false;
  } else {
    return (cond + op + cmd + s + I + rn + rd + src2);
  }
}

const compProcess = array => {
  let cmd = "01";
  let op = "00";
  let s = "1";
  let I = "0";
  let cond = "111";
  if (array.length !== 3) {
    return false;
  } else {
    rd = "0000";
    operand1 = array[1];
    operand2 = array[2];
    if ((+operand1 || operand1 === "0") && (+operand2 || operand2 === "0")) {
      return false;
    } else {
      if (+operand1 || operand1 === "0") {
        rn = operand2;
        I = "1";
        src2 = fillBits((+operand1).toString(2), 7);
      } else if (+operand2 || operand2 === "0") {
        rn = operand1;
        I = "1";
        src2 = fillBits((+operand2).toString(2), 7);
      } else {
        rn = operand1;
        src2 = registerToBin(operand2);
        src2 += "000";
      }
    }
  }
  rn = registerToBin(rn);
  if ((!src2 && src2 !== "0000000") || !rn || !rd) {
    return false;
  } else {
    return (cond + op + cmd + s + I + rn + rd + src2);
  }
}

const mulProcess = (array, cond) => {
  let cmd = "10";
  let op = "00";
  let s = "0";
  let I = "0";
  if (array.length !== 4) {
    return false;
  } else {
    rd = registerToBin(array[1]);
    operand1 = array[2];
    operand2 = array[3];
    if ((+operand1 || operand1 === "0") && (+operand2 || operand2 === "0")) {
      return false;
    } else {
      if (+operand1  || operand1 === "0") {
        rn = operand2;
        I = "1";
        src2 = fillBits((+operand1).toString(2), 7);
      } else if (+operand2  || operand2 === "0") {
        rn = operand1;
        I = "1";
        src2 = fillBits((+operand2).toString(2), 7);
      } else {
        rn = operand1;
        src2 = registerToBin(operand2);
        src2 += "000";
      }
    }
  }
  rn = registerToBin(rn);
  if ((!src2 && src2 !== "0000000") || !rn || !rd) {
    return false;
  } else {
    return (cond + op + cmd + s + I + rn + rd + src2);
  }
}

const moverProcess = (array, cond) => {
  let cmd = "11";
  let op = "00";
  let s = "0";
  let I = "0";
  if (array.length !== 3) {
    return false;
  } else {
    rn = "0000";
    operand1 = array[1];
    operand2 = array[2];
    if ((+operand1 || operand1 === "0") && (+operand2 || operand2 === "0")) {
      return false;
    } else {
      rd = operand1;
      if (+operand2 || operand2 === "0") {
        I = "1";
        src2 = fillBits((+operand2).toString(2), 7);
      } else {
        src2 = registerToBin(operand2);
        src2 += "000";
      }
    }
  }
  rd = registerToBin(rd);
  if ((!src2 && src2 !== "0000000") || !rd) {
    return false;
  } else {
    return (cond + op + cmd + s + I + rn + rd + src2);
  }
}

const loadProcess = (array, cond) => {
  let op = "01";
  let fixed = "11";
  let L = "1";
  let I = "0";
  if (array.length > 4 || array.length < 3) {
    return false;
  } else {
    if (array.length === 3) {
      if(array[2][0] !== "[" || array[2].substr(-1) !== "]") {
        return false;
      }
      I = "1";
      rn = array[2].substr(1, array[2].length - 2);
      src2 = fillBits("0", 7);
    } else {
      if(array[2][0] !== "[" || array[3].substr(-1) !== "]") {
        return false;
      }
      rn = array[2].substr(1, array[2].length);
      offset = array[3].substr(0, array[3].length - 1);
      if (+offset || offset === "0") {
        src2 = fillBits((+offset).toString(2), 7);
        I = "1";
      } else {
        src2 = registerToBin(offset);
        if(!src2) {
          return false;
        }
        src2 += "000";
      }
    }
    rd = registerToBin(array[1]);
  }
  rn = registerToBin(rn);
  if ((!src2 && src2 !== "0000000") || !rn || !rd) {
    return false;
  } else {
    return (cond + op + fixed + L + I + rn + rd + src2);
  }
}

const storeProcess = (array, cond) => {
  let op = "01";
  let fixed = "11";
  let L = "0";
  let I = "0";
  if (array.length > 4 || array.length < 3) {
    return false;
  } else {
    if (array.length === 3) {
      if(array[2][0] !== "[" || array[2].substr(-1) !== "]") {
        return false;
      }
      I = "1";
      rn = array[2].substr(1, array[2].length - 2);
      src2 = fillBits("0", 7);
    } else {
      if(array[2][0] !== "[" || array[3].substr(-1) !== "]") {
        return false;
      }
      rn = array[2].substr(1, array[2].length);
      offset = array[3].substr(0, array[3].length - 1);
      if (+offset || offset === "0") {
        src2 = fillBits((+offset).toString(2), 7);
        I = "1";
      } else {
        src2 = registerToBin(offset);
        if(!src2) {
          return false;
        }
        src2 += "000";
      }
    }
    rd = registerToBin(array[1]);
  }
  rn = registerToBin(rn);
  if ((!src2 && src2 !== "0000000") || !rn || !rd) {
    return false;
  } else {
    return (cond + op + fixed + L + I + rn + rd + src2);
  }
}

const saltoProcess = (array, cond, index, branchPlaces) => {
  index += 1;
  if(array.length > 2) {
    return false;
  }
  let op = "10";
  let PCtoCalc = index + 2;
  let branchName = array[1] + ":";
  let branchIndex = branchPlaces[branchName];
  if(!branchIndex) {
    return false;
  }
  let moveCalc = branchIndex - PCtoCalc;
  moveCalc = moveCalc * 4;
  if(moveCalc < 0) {
    moveCalc = moveCalc.toString(2).substr(1, moveCalc.length);
    moveCalc = fillBits(moveCalc, 19);
    moveCalc = twosComplement(moveCalc);
  } else {
    moveCalc = moveCalc.toString(2);
    moveCalc = fillBits(moveCalc, 19);
  }
  return (cond + op + moveCalc);
}

const processInstructions = (processedArray, branchPlaces) => {
  return processedArray.map((value, index, arr) => {
    cond = "111";
    if (value[0].substr(-2) === "ig") {
      cond = "000";
      value[0] = value[0].substr(0, value[0].length -2);
    } else if (value[0].substr(-3) === "neg") {
      cond = "001";
      value[0] = value[0].substr(0, value[0].length -3);
    } else if (value[0].substr(-2) === "mq") {
      cond = "010";
      value[0] = value[0].substr(0, value[0].length -2);
    }
    switch(value[0]) {
      case 'sum':
        return sumProcess(value, cond);
      case 'comp':
        return compProcess(value);
      case 'mul':
        return mulProcess(value, cond);
      case 'mover':
        return moverProcess(value, cond);
      case 'load':
        return loadProcess(value, cond);
      case 'store':
        return storeProcess(value, cond);
      case 'salto':
        return saltoProcess(value, cond, index, branchPlaces);
      default:
        if(value[0].substr(-1) !== ":") {
          return false;
        } else {
          return true;
        }
    }
  });
}

const compileISA = processedArray => {
  let branchPlaces = getAllLabels(processedArray);
  processedArray = processedArray.filter((val, index, arr) => {
    return val.length !== 1;
  });
  let compiledInstructions = processInstructions(processedArray, branchPlaces);
  return compiledInstructions;
};