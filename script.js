
const scenes = [...document.querySelectorAll('.scene')];
const dots = [...document.querySelectorAll('.dot')];
const progress = document.getElementById('progressBar');
const toast = document.getElementById('toast');

let current = 0;
let toastTimer;

function goToScene(index) {
  index = Math.max(0, Math.min(scenes.length - 1, index));
  current = index;

  scenes[index].scrollIntoView({
    behavior: 'smooth',
    block: 'start'
  });

  dots.forEach((dot, i) => {
    dot.classList.toggle('active', i === index);
  });

  progress.style.width =
    ((index + 1) / scenes.length * 100) + '%';

  const messages = [
    'СЕГОДНЯ ТВОЙ МИР',
    'ТЫ — НЕ ПОВТОР',
    'ТВОЯ ЭНЕРГИЯ',
    'СОХРАНИ ЭТО',
    'ONE OF ONE',
    'ПУСТЬ БУДЕТ БОЛЬШЕ',
    'СЕКРЕТНАЯ ГЛАВА',
    'ТВОЯ НОВАЯ ЭРА'
  ];

  toast.textContent = messages[index];
  toast.classList.add('show');

  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => {
    toast.classList.remove('show');
  }, 1500);
}

// Переходы между слайдами
document.querySelectorAll('[data-next]').forEach(button => {
  button.addEventListener('click', () => {
    goToScene(Number(button.dataset.next));
  });
});

dots.forEach(dot => {
  dot.addEventListener('click', () => {
    goToScene(Number(dot.dataset.goto));
  });
});

// Отслеживание текущего слайда
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting && entry.intersectionRatio > 0.42) {
      current = Number(entry.target.dataset.scene);

      dots.forEach((dot, i) => {
        dot.classList.toggle('active', i === current);
      });

      progress.style.width =
        ((current + 1) / scenes.length * 100) + '%';
    }
  });
}, { threshold: [0.42, 0.65] });

scenes.forEach(scene => observer.observe(scene));

// Интерактивные причины
document.querySelectorAll('.reason-row').forEach(row => {
  row.addEventListener('click', () => {
    document.querySelectorAll('.reason-row').forEach(item => {
      item.classList.remove('open');
    });

    row.classList.add('open');

    document.getElementById('reasonReveal').textContent =
      row.dataset.reason;
  });
});

// Загадывание желания
document.getElementById('wishBtn').addEventListener('click', () => {
  document.getElementById('wishMessage').classList.add('show');

  document.getElementById('wishBtn').innerHTML =
    'ЖЕЛАНИЕ ОТПРАВЛЕНО <span>✦</span>';

  burstStars();
});

// Секретный подарок
const giftBox = document.getElementById('giftBox');
const giftLetter = document.getElementById('giftLetter');

giftBox.addEventListener('click', () => {
  giftBox.classList.add('open');
  giftLetter.classList.add('show');

  document.getElementById('giftHint').textContent =
    'СЕКРЕТ ОТКРЫТ';

  burstStars();
});

document.getElementById('letterClose').addEventListener('click', () => {
  giftLetter.classList.remove('show');
});

// Финальная кнопка
document.getElementById('replayBtn').addEventListener('click', () => {
  giftLetter.classList.remove('show');
  giftBox.classList.remove('open');
  document.getElementById('wishMessage').classList.remove('show');

  goToScene(0);
});

// Свечение за курсором
const glow = document.getElementById('cursorGlow');

window.addEventListener('pointermove', event => {
  glow.style.left = event.clientX + 'px';
  glow.style.top = event.clientY + 'px';
});

// Эффект наклона фотографии
document.querySelectorAll('.tilt-card').forEach(card => {
  card.addEventListener('pointermove', event => {
    if (innerWidth < 800) return;

    const rect = card.getBoundingClientRect();
    const x = (event.clientX - rect.left) / rect.width - 0.5;
    const y = (event.clientY - rect.top) / rect.height - 0.5;

    card.style.transform =
      `rotate(${x * 4 - 2}deg) perspective(900px) ` +
      `rotateY(${x * 5}deg) rotateX(${-y * 5}deg)`;
  });

  card.addEventListener('pointerleave', () => {
    card.style.transform = 'rotate(-2deg)';
  });
});

// Разлетающиеся звёзды
function burstStars() {
  const section = scenes[current];

  for (let i = 0; i < 28; i++) {
    const star = document.createElement('span');

    star.className = 'burst-star';
    star.textContent = i % 3 === 0 ? '✦' : '·';

    star.style.left = (35 + Math.random() * 30) + '%';
    star.style.top = (35 + Math.random() * 30) + '%';

    star.style.setProperty(
      '--dx',
      (Math.random() * 360 - 180) + 'px'
    );

    star.style.setProperty(
      '--dy',
      (Math.random() * -330 - 30) + 'px'
    );

    section.appendChild(star);

    setTimeout(() => star.remove(), 1300);
  }
}

const animationStyle = document.createElement('style');

animationStyle.textContent = `
.burst-star {
  position: absolute;
  z-index: 40;
  pointer-events: none;
  color: #ff9be2;
  font-size: 22px;
  text-shadow: 0 0 12px #ff69ce;
  animation: burst 1.2s ease-out forwards;
}
@keyframes burst {
  to {
    transform: translate(var(--dx), var(--dy))
      rotate(180deg) scale(.1);
    opacity: 0;
  }
}`;

document.head.appendChild(animationStyle);

// Кнопка визуализатора звука
const soundToggle = document.getElementById('soundToggle');

soundToggle.addEventListener('click', () => {
  const active = soundToggle.classList.toggle('playing');

  document.getElementById('soundLabel').textContent =
    active ? 'SOUND VISUALIZER ON' : 'SOUND OFF';

  toast.textContent = active
    ? 'ВИЗУАЛИЗАТОР ВКЛЮЧЁН'
    : 'ВИЗУАЛИЗАТОР ВЫКЛЮЧЕН';

  toast.classList.add('show');

  clearTimeout(toastTimer);

  toastTimer = setTimeout(() => {
    toast.classList.remove('show');
  }, 1800);
});

// Управление клавишами
let wheelLock = false;

window.addEventListener('keydown', event => {
  if (['ArrowDown', 'PageDown'].includes(event.key)) {
    if (wheelLock) return;

    wheelLock = true;
    goToScene(current + 1);

    setTimeout(() => {
      wheelLock = false;
    }, 650);
  }

  if (['ArrowUp', 'PageUp'].includes(event.key)) {
    if (wheelLock) return;

    wheelLock = true;
    goToScene(current - 1);

    setTimeout(() => {
      wheelLock = false;
    }, 650);
  }

  if (event.key === 'Escape') {
    giftLetter.classList.remove('show');
  }
});
