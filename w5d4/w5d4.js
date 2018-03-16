function madLib(verb, adj, noun) {
  console.log("We shall  ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}");
}

function isSubstring(string, sub) {
  return string.includes(sub);
}

function fizzbuzz(array) {
  const fizzyArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzyArr.push(el);
    }
  });

  return fizzyArr;
}
