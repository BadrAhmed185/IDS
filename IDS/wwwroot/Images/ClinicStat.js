function selectStat(selectedBtn) {
    document.querySelectorAll('.stat-btn').forEach(btn => btn.classList.remove('active'));
    selectedBtn.classList.add('active');

    const type = selectedBtn.dataset.value;
    const container = document.querySelector('.date-selectors');

    const today = new Date();
    const currentYear = today.getFullYear();
    const currentMonth = today.getMonth() + 1;
    const dateString = today.toISOString().split('T')[0];
    let html = "";

    if (type === "day") {
        html = `
      <label>اختر اليوم:</label>
      <input type="date" name="selectedDate" value="${dateString}" class="form-control" />`;
    } else if (type === "month") {
        html = `
      <label>اختر الشهر والسنة:</label>
      <select name="month" class="form-select">
        ${[...Array(12).keys()].map(i => `<option value="${i + 1}" ${i + 1 === currentMonth ? 'selected' : ''}>${i + 1}</option>`).join('')}
      </select>
      <select name="year" class="form-select">
        ${[...Array(6).keys()].map(i => {
            const y = currentYear - 3 + i;
            return `<option value="${y}" ${y === currentYear ? 'selected' : ''}>${y}</option>`;
        }).join('')}
      </select>`;
    } else if (type === "year") {
        html = `
      <label>اختر السنة:</label>
      <select name="year" class="form-select">
        ${[...Array(6).keys()].map(i => {
            const y = currentYear - 3 + i;
            return `<option value="${y}" ${y === currentYear ? 'selected' : ''}>${y}</option>`;
        }).join('')}
      </select>`;
    } else if (type === "custom") {
        html = `
      <label>الفترة:</label>
      <input type="date" name="fromDate" value="${dateString}" class="form-control" />
      <input type="date" name="toDate" value="${dateString}" class="form-control" />`;
    }

    container.innerHTML = html;
}

window.addEventListener("DOMContentLoaded", function () {
    const monthlyBtn = Array.from(document.querySelectorAll('.stat-btn')).find(btn => btn.textContent.trim() === "شهري");

    if (monthlyBtn) {
        monthlyBtn.click();
    }
});

function loadPartialView(url) {
    fetch(url)
        .then(response => {
            if (!response.ok) throw new Error("Network response was not ok");
            return response.text();
        })
        .then(html => {
            const container = document.querySelector("#partialView");
            if (container) {
                container.innerHTML = html;
            } else {
                window.location.href = url;
            }
        })
        .catch(error => {
            console.error("Error loading partial view:", error);
            window.location.href = url;
        });
}
