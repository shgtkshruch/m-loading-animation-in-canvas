window.onload = ->
  drow_canvas()

drow_canvas = ->
  particles = []
  particlesNum = 100

  canvas = document.getElementById 'c'
  ctx = canvas.getContext '2d'

  cw = canvas.width = 580
  ch = canvas.height = 450

  gradient = ->
    red = '#cf0501'
    orange = '#ff9704'

    g = ctx.createLinearGradient 0, 0, 0, ch
    g.addColorStop 0, orange
    g.addColorStop 1, red

    ctx.fillStyle = g
    ctx.fillRect 0, 0, cw, ch

  drawM = ->
    ctx.moveTo 0,10
    ctx.lineTo 194,10
    ctx.lineTo 306,139
    ctx.lineTo 419,10
    ctx.lineTo 570,10
    ctx.lineTo 570,425
    ctx.lineTo 421,425
    ctx.lineTo 421,281
    ctx.lineTo 306,425
    ctx.lineTo 214,281
    ctx.lineTo 214,425
    ctx.lineTo 66,425
    ctx.lineTo 66,113
    ctx.lineTo 10,113
    ctx.lineTo 10,10
    ctx.strokeStyle = 'white'
    ctx.lineWidth = 20
    ctx.stroke()

  class Particle
    constructor: ->
      @x = @_random cw
      @y = ch
      @r = 3 + @_random 15
      @opacity = Math.random()
      @velocity = @opacity * 10

    _random: (n) ->
      Math.floor Math.random() * n

  for i in [0...particlesNum]
    particles.push new Particle()

  (draw = ->
    ctx.save()

    ctx.beginPath()
    drawM()
    ctx.clip()
    gradient()

    for i in [0...particlesNum]
      p = particles[i]
      ctx.fillStyle = 'rgba(255,255,255,' + p.opacity + ')'

      ctx.beginPath()
      ctx.arc p.x, p.y, p.r, 0, Math.PI * 2, false

      p.y -= p.velocity
      ctx.fill()

      p.y = ch if p.y < 0

    ctx.restore()

    requestAnimationFrame draw
  )()
