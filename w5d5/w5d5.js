window.setTimeout(function() {
  alert("Hammertime");
  }, 5000
);


function closureTimeout(time) {
  window.setTimeout(function() {
    alert("${time} for Hammertime.");
  });
}
