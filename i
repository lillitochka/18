<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Happy Birthday Sofia</title>
  <style>
    :root{
      --pink:#ff0a76;
      --soft:#ffd8e7;
      --cream:#fffbd6;
      --dark:#111;
    }
    *{box-sizing:border-box}
    html{scroll-behavior:smooth}
    body{
      margin:0;
      font-family:Arial, Helvetica, sans-serif;
      background:#ffdbe7;
      color:#222;
      overflow-x:hidden;
    }
    section{
      min-height:100vh;
      position:relative;
      overflow:hidden;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:40px 18px;
    }
    .screen{
      width:min(1180px,100%);
      position:relative;
      z-index:2;
    }
    .countdown{
      background:#000;
      color:#fff;
      font-weight:900;
      font-style:italic;
      font-size:clamp(100px,22vw,360px);
      letter-spacing:.02em;
      text-align:center;
    }
    .countdown span{
      display:inline-block;
      opacity:0;
      transform:scale(.75);
      animation:countPop .75s ease forwards;
    }
    .countdown span:nth-child(1){animation-delay:.2s}
    .countdown span:nth-child(2){animation-delay:1.05s}
    .countdown span:nth-child(3){animation-delay:1.9s}
    @keyframes countPop{
      to{opacity:1;transform:scale(1)}
    }

    .striped{
      background-image:url("47c86ab73112f1bb9a289748668eef53c.jpg");
      background-size:cover;
      background-position:center;
      background-color:#ffd9e7;
    }
    .pink{
      background:#ffdbe7;
    }
    .pony-edge{
      background-image:url("654d8b6a55cafc324b4283b1e255d115.jpg");
      background-size:cover;
      background-position:center bottom;
      background-color:#ffdbe7;
    }
    .pony-corners{
      background-image:url("87344fa9dfed6cd06aa9e394b34d3aca.jpg");
      background-size:cover;
      background-position:center;
      background-color:#fff;
    }

    .hero{
      display:grid;
      grid-template-columns:1.3fr .7fr;
      gap:20px;
      align-items:center;
    }
    .hero h1{
      margin:0;
      font-family:Georgia, serif;
      font-size:clamp(62px,10vw,155px);
      line-height:.88;
      color:#fff4ef;
      -webkit-text-stroke:6px var(--pink);
      text-shadow:0 8px 0 rgba(174,0,77,.14);
      min-height:2.7em;
    }
    .hero-side{
      display:flex;
      flex-direction:column;
      gap:12px;
      align-items:center;
      justify-content:center;
    }
    .hero-side img{
      max-width:100%;
      display:block;
      object-fit:contain;
      filter:drop-shadow(0 15px 25px rgba(0,0,0,.12));
    }
    .logo{
      width:min(360px,90%);
      opacity:0;
      animation:floatIn 1.2s .8s cubic-bezier(.2,.8,.2,1) forwards;
    }
    .pinkie{
      width:min(430px,100%);
      opacity:0;
      transform:translateY(180px) rotate(-8deg) scale(.85);
      animation:peekUp 1.4s 1.2s cubic-bezier(.18,.9,.2,1.15) forwards;
    }
    @keyframes peekUp{
      to{opacity:1;transform:translateY(0) rotate(0) scale(1)}
    }
    @keyframes floatIn{
      from{opacity:0;transform:translateY(-20px) scale(.9)}
      to{opacity:1;transform:none}
    }

    .center{
      text-align:center;
    }
    .type{
      display:inline-block;
      color:#ffdbe7;
      -webkit-text-stroke:4px var(--pink);
      font-weight:900;
      font-size:clamp(44px,7vw,105px);
      line-height:1.15;
      white-space:normal;
      min-height:1.2em;
    }
    .smalltype{
      font-size:clamp(36px,5.5vw,78px);
    }

    .feature{
      display:grid;
      grid-template-columns:1fr 420px;
      gap:35px;
      align-items:center;
    }
    .feature.reverse{
      grid-template-columns:420px 1fr;
    }
    .feature img{
      width:100%;
      max-height:540px;
      object-fit:contain;
      opacity:0;
    }
    .fly-right{
      transform:translateX(180px) rotate(8deg) scale(.8);
    }
    .fly-left{
      transform:translateX(-180px) rotate(-8deg) scale(.8);
    }
    .active .fly-right,.active .fly-left{
      animation:flyIn 1.2s .3s cubic-bezier(.2,.85,.25,1.1) forwards;
    }
    @keyframes flyIn{
      to{opacity:1;transform:none}
    }

    .friends img{
      width:min(520px,92%);
      margin:18px auto 0;
      display:block;
      opacity:0;
      transform:translateY(100px) scale(.8);
    }
    .active .friends img{
      animation:friendsPop 1.2s .35s cubic-bezier(.15,.9,.25,1.15) forwards;
    }
    @keyframes friendsPop{to{opacity:1;transform:none}}

    .wish{
      max-width:1050px;
      margin:auto;
      text-align:center;
    }

    .memories{
      padding-top:80px;
      padding-bottom:100px;
    }
    .memory-wrap{
      width:min(1150px,100%);
      min-height:760px;
      margin:auto;
      position:relative;
    }
    .memory-title{
      position:absolute;
      left:50%;
      bottom:0;
      transform:translateX(-50%);
      z-index:20;
      width:100%;
      text-align:center;
      color:#ffdbe7;
      -webkit-text-stroke:4px var(--pink);
      font-weight:900;
      font-size:clamp(54px,7vw,110px);
    }
    .photo{
      position:absolute;
      background:#fff;
      padding:12px;
      box-shadow:0 22px 45px rgba(0,0,0,.2);
      opacity:0;
      transform:translateY(60px) scale(.9);
    }
    .photo img{
      width:100%;
      height:100%;
      object-fit:cover;
      display:block;
    }
    .active .photo{
      animation:photoIn 1s ease forwards;
    }
    .photo.p1{left:3%;top:8%;width:49%;height:56%;transform:rotate(-1.5deg) translateY(60px) scale(.9);animation-delay:.2s}
    .photo.p2{right:1%;top:7%;width:43%;height:58%;transform:rotate(7deg) translateY(60px) scale(.9);animation-delay:1s}
    .photo.p3{left:1%;top:3%;width:31%;height:55%;transform:rotate(-2deg) translateY(60px) scale(.9);animation-delay:1.8s}
    .photo.p4{left:26%;top:2%;width:38%;height:61%;transform:rotate(1deg) translateY(60px) scale(.9);animation-delay:2.6s}
    @keyframes photoIn{
      to{opacity:1;transform:var(--final-transform,rotate(0) translateY(0) scale(1))}
    }
    .photo.p1{--final-transform:rotate(-1.5deg) translateY(0) scale(1)}
    .photo.p2{--final-transform:rotate(7deg) translateY(0) scale(1)}
    .photo.p3{--final-transform:rotate(-2deg) translateY(0) scale(1)}
    .photo.p4{--final-transform:rotate(1deg) translateY(0) scale(1)}

    .cursor::after{
      content:"|";
      animation:blink .65s steps(1) infinite;
      margin-left:3px;
    }
    @keyframes blink{50%{opacity:0}}

    .spacer-note{
      position:absolute;
      inset:auto 18px 18px auto;
      font-size:12px;
      opacity:.35;
    }

    @media (max-width:800px){
      .hero,.feature,.feature.reverse{
        grid-template-columns:1fr;
      }
      .hero{
        text-align:center;
      }
      .hero h1{
        -webkit-text-stroke:4px var(--pink);
      }
      .type,.memory-title{
        -webkit-text-stroke:2.5px var(--pink);
      }
      .memory-wrap{min-height:760px}
      .photo.p1{left:5%;top:3%;width:67%;height:35%}
      .photo.p2{right:3%;top:27%;width:60%;height:35%}
      .photo.p3{left:4%;top:50%;width:49%;height:31%}
      .photo.p4{right:5%;top:52%;width:49%;height:31%}
      .memory-title{bottom:0}
    }
  </style>
</head>
<body>

<section class="countdown">
  <div><span>3...</span><span>2...</span><span>1!!</span></div>
</section>

<section class="striped observe">
  <div class="screen hero">
    <h1 class="typing" data-text="HAPPY BIRTHDAY SOFIA!" data-speed="90"></h1>
    <div class="hero-side">
      <img class="logo" src="dd0382cfbf3ff6f235685c222c313c67.jpg" alt="My Little Pony" />
      <img class="pinkie" src="1fe706fe4fd660b4687c257f2bd0ae7f.jpg" alt="Pinkie Pie" />
    </div>
  </div>
</section>

<section class="pony-edge observe">
  <div class="screen center">
    <div class="type smalltype typing" data-text="Софія! Вітаю тебе з днем народження!))" data-speed="65"></div>
  </div>
</section>

<section class="pink observe">
  <div class="screen feature">
    <div>
      <div class="type smalltype typing" data-text="Бажаю тобі багато грошей" data-speed="60"></div>
    </div>
    <img class="fly-right" src="db2016a48b45d339c3603739fbc66fbd.jpg" alt="Котик з грошима" />
  </div>
</section>

<section class="pony-edge observe">
  <div class="screen center friends">
    <div class="type typing" data-text="Багато друзів!" data-speed="70"></div>
    <img src="dd0382cfbf3ff6f235685c222c313c67.jpg" alt="Три поняшки" />
  </div>
</section>

<section class="pony-edge observe">
  <div class="screen wish">
    <div class="type smalltype typing" data-text="Здоров’я, мирного неба, та кохання!!" data-speed="65"></div>
  </div>
</section>

<section class="pony-corners memories observe">
  <div class="memory-wrap">
    <div class="photo p1"><img src="bb4ef77f5ef4a28810410e89da6ec6ba.jpg" alt="Фото біля води" /></div>
    <div class="photo p2"><img src="ad78cf73a59fd77a1693b4cbfe6bbe20.jpg" alt="Фото на дорозі" /></div>
    <div class="photo p3"><img src="2118d7b3ec5a6164ee455269adad5ce2.jpg" alt="Фото ввечері" /></div>
    <div class="photo p4"><img src="117d67883442ed43a3c97748f5392985.jpg" alt="Фото в лісі" /></div>
    <div class="memory-title typing" data-text="пам’ятаєш?" data-speed="85"></div>
  </div>
</section>

<script>
  const sleep = ms => new Promise(r => setTimeout(r, ms));

  async function typeText(el){
    if(el.dataset.done) return;
    el.dataset.done = "1";
    const text = el.dataset.text || "";
    const speed = Number(el.dataset.speed || 70);
    el.textContent = "";
    el.classList.add("cursor");
    for(let i=0;i<text.length;i++){
      el.textContent += text[i];
      await sleep(speed);
    }
    await sleep(250);
    el.classList.remove("cursor");
  }

  const observer = new IntersectionObserver((entries)=>{
    entries.forEach(entry=>{
      if(entry.isIntersecting){
        const section = entry.target;
        section.classList.add("active");
        section.querySelectorAll(".typing").forEach(el=>typeText(el));
      }
    });
  },{threshold:.35});

  document.querySelectorAll(".observe").forEach(s=>observer.observe(s));

  // Автоперехід від чорного відліку до другого кадру
  setTimeout(()=>{
    window.scrollTo({top:window.innerHeight,behavior:"smooth"});
  },3300);
</script>

</body>
</html>
