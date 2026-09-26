const AUTOPLAY_DELAY = 10_000;

const initializeHeroCarousels = () => document.querySelectorAll("[data-hero-carousel]").forEach((carousel) => {
  const slides = [...carousel.querySelectorAll("[data-hero-slide]")];
  const dots = [...carousel.querySelectorAll("[data-hero-dot]")];
  const controls = carousel.querySelector("[data-hero-controls]");
  const previous = carousel.querySelector("[data-hero-previous]");
  const next = carousel.querySelector("[data-hero-next]");
  const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)");

  if (slides.length < 2 || !controls || !previous || !next) return;

  let current = 0;
  let timer;
  let paused = false;

  const show = (index) => {
    current = (index + slides.length) % slides.length;

    slides.forEach((slide, slideIndex) => {
      const active = slideIndex === current;
      slide.classList.toggle("is-active", active);
      slide.setAttribute("aria-hidden", String(!active));
    });

    dots.forEach((dot, dotIndex) => {
      const active = dotIndex === current;
      dot.classList.toggle("is-active", active);
      dot.setAttribute("aria-current", String(active));
    });
  };

  const stop = () => {
    window.clearInterval(timer);
    timer = undefined;
  };

  const start = () => {
    stop();
    if (paused || reducedMotion.matches || document.hidden) return;
    timer = window.setInterval(() => show(current + 1), AUTOPLAY_DELAY);
  };

  const select = (index) => {
    show(index);
    start();
  };

  previous.addEventListener("click", () => select(current - 1));
  next.addEventListener("click", () => select(current + 1));
  dots.forEach((dot, index) => dot.addEventListener("click", () => select(index)));

  carousel.addEventListener("pointerenter", () => {
    paused = true;
    stop();
  });
  carousel.addEventListener("pointerleave", () => {
    paused = false;
    start();
  });
  carousel.addEventListener("focusin", () => {
    paused = true;
    stop();
  });
  carousel.addEventListener("focusout", (event) => {
    if (carousel.contains(event.relatedTarget)) return;
    paused = false;
    start();
  });
  document.addEventListener("visibilitychange", start);
  reducedMotion.addEventListener("change", start);

  controls.hidden = false;
  start();
});

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", initializeHeroCarousels, { once: true });
} else {
  initializeHeroCarousels();
}
