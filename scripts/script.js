(function() {
  var drow_canvas;

  window.onload = function() {
    return drow_canvas();
  };

  drow_canvas = function() {
    var Particle, canvas, ch, ctx, cw, draw, drawM, gradient, i, particles, particlesNum, _i;
    particles = [];
    particlesNum = 100;
    canvas = document.getElementById('c');
    ctx = canvas.getContext('2d');
    cw = canvas.width = 580;
    ch = canvas.height = 450;
    gradient = function() {
      var g, orange, red;
      red = '#cf0501';
      orange = '#ff9704';
      g = ctx.createLinearGradient(0, 0, 0, ch);
      g.addColorStop(0, orange);
      g.addColorStop(1, red);
      ctx.fillStyle = g;
      return ctx.fillRect(0, 0, cw, ch);
    };
    drawM = function() {
      ctx.moveTo(0, 10);
      ctx.lineTo(194, 10);
      ctx.lineTo(306, 139);
      ctx.lineTo(419, 10);
      ctx.lineTo(570, 10);
      ctx.lineTo(570, 425);
      ctx.lineTo(421, 425);
      ctx.lineTo(421, 281);
      ctx.lineTo(306, 425);
      ctx.lineTo(214, 281);
      ctx.lineTo(214, 425);
      ctx.lineTo(66, 425);
      ctx.lineTo(66, 113);
      ctx.lineTo(10, 113);
      ctx.lineTo(10, 10);
      ctx.strokeStyle = 'white';
      ctx.lineWidth = 20;
      return ctx.stroke();
    };
    Particle = (function() {
      function Particle() {
        this.x = this._random(cw);
        this.y = ch;
        this.r = 3 + this._random(15);
        this.opacity = Math.random();
        this.velocity = this.opacity * 10;
      }

      Particle.prototype._random = function(n) {
        return Math.floor(Math.random() * n);
      };

      return Particle;

    })();
    for (i = _i = 0; 0 <= particlesNum ? _i < particlesNum : _i > particlesNum; i = 0 <= particlesNum ? ++_i : --_i) {
      particles.push(new Particle());
    }
    return (draw = function() {
      var p, _j;
      ctx.save();
      ctx.beginPath();
      drawM();
      ctx.clip();
      gradient();
      for (i = _j = 0; 0 <= particlesNum ? _j < particlesNum : _j > particlesNum; i = 0 <= particlesNum ? ++_j : --_j) {
        p = particles[i];
        ctx.fillStyle = 'rgba(255,255,255,' + p.opacity + ')';
        ctx.beginPath();
        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2, false);
        p.y -= p.velocity;
        ctx.fill();
        if (p.y < 0) {
          p.y = ch;
        }
      }
      ctx.restore();
      return requestAnimationFrame(draw);
    })();
  };

}).call(this);
