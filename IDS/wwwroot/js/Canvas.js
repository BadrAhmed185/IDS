document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById('canvas');
    const engine = new Engine();
    engine.setCanvas(canvas);
    engine.init();

    const teethIds = engine.mouth
        .map(tooth => tooth.id);

    let counter = 0;
    teethIds.forEach(tooth => {
        if (document.getElementById(`tooth${tooth}`).checked) {
            engine.mouth[counter].highlight = engine.settings.COLOR_HIGHLIGHT;
            counter++;
        }
        else {
            counter++;
        }
    });


    canvas.addEventListener('contextmenu', e => e.preventDefault());


    const btnAdult = document.getElementById('btnAdult');
    const btnChild = document.getElementById('btnChild');
    const btnReset = document.getElementById('btnReset');
    const btnSubmit = document.querySelector('.submit-btn');

    function activateButton(activeBtn, inactiveBtn) {
        activeBtn.classList.add('active');
        inactiveBtn.classList.remove('active');
    }

    btnAdult.addEventListener('click', () => {
        engine.changeView('0');
        activateButton(btnAdult, btnChild);
        engine.reset();
    });

    btnChild.addEventListener('click', () => {
        engine.changeView('1');
        activateButton(btnChild, btnAdult);
        engine.reset();
    });

    btnReset.addEventListener('click', () => {
        engine.reset();
    });


    canvas.addEventListener('mousedown', e => engine.onMouseClick(e));
    canvas.addEventListener('mousemove', e => engine.onMouseMove(e));
    canvas.addEventListener('click', e => {
        const x = engine.getXpos(e);
        const y = engine.getYpos(e);
        engine.mouth.forEach(tooth => {
            if (tooth.checkCollision(x, y)) {
                const sel = !tooth.highlight;
                tooth.toggleSelected(sel);
                if (sel) tooth.highlightColor = engine.settings.COLOR_HIGHLIGHT;
            }
        });
        engine.update();
    });

    //btnSubmit.addEventListener('click', () => {
    //    const selectedIds = engine.mouth
    //        .filter(tooth => tooth.highlight)
    //        .map(tooth => tooth.id);

    //    selectedIds.forEach(teeth => {
    //        document.getElementById(`tooth${teeth}`).checked = true;


    //    });

    btnSubmit.addEventListener('click', () => {
        const teeth = engine.mouth;
            //.filter(tooth => tooth.highlight)
            //.map(tooth => tooth.id);

            teeth.forEach(tooth => {
            if (tooth.highlight)
                document.getElementById(`tooth${tooth.id}`).checked = true;
            else
                document.getElementById(`tooth${tooth.id}`).checked = false;
        });

        // alert('Selected teeth: ' + (selectedIds.length ? selectedIds.join(', ') : 'None'));
    });
});