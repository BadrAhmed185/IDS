function closeMessage(button) {
    const message = button.closest('.error-message, .success-message');
    message.classList.add('hide');
    setTimeout(() => {
        message.remove();
    }, 300);
}

document.addEventListener('DOMContentLoaded', function () {
    const messages = document.querySelectorAll('.error-message, .success-message');
    messages.forEach(msg => {
        setTimeout(() => {
            msg.classList.add('hide');
            setTimeout(() => {
                msg.remove();
            }, 300);
        }, 50000); // auto-dismiss after 50 seconds
    });
});