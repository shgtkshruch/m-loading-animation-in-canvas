window.onload = ->
  drow_canvas()

drow_canvas = ->
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

  ctx.save()
  ctx.beginPath()
  drawM()
  ctx.clip()
  gradient()
  ctx.restore()
