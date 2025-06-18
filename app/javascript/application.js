// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
  const downloadBtn = document.getElementById('downloadAsPng');
  
  if (downloadBtn) {
    downloadBtn.addEventListener('click', function() {
      html2canvas(document.querySelector('.card')).then(canvas => {
        const link = document.createElement('a');
        link.download = 'booking-confirmation-' + new Date().toISOString().slice(0, 10) + '.png';
        link.href = canvas.toDataURL('image/png');
        link.click();
      });
    });
  }
});