document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = "green";
  ctx.fillRect = (500, 500, 500, 500);

  ctx.beginPath();
  ctx.arc(120, 120, 30, 0, 2*Math.PI, true);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "purple";
  ctx.fill();
});
