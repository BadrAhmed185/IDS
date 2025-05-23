/* 
 * Copyright (c) 2018 Bardur Thomsen <https://github.com/bardurt>.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *    Bardur Thomsen <https://github.com/bardurt> - initial API and implementation and/or initial documentation
 */

// include the necessary scripts
document.writeln("<script type='text/javascript' src='js/constants.js'></script>");
document.writeln("<script type='text/javascript' src='js/settings.js'></script>");
document.writeln("<script type='text/javascript' src='js/rect.js'></script>");
document.writeln("<script type='text/javascript' src='js/damage.js'></script>");
document.writeln("<script type='text/javascript' src='js/textBox.js'></script>");
document.writeln("<script type='text/javascript' src='js/tooth.js'></script>");
document.writeln("<script type='text/javascript' src='js/menuItem.js'></script>");
document.writeln("<script type='text/javascript' src='js/renderer.js'></script>");
document.writeln("<script type='text/javascript' src='js/odontogramaGenerator.js'></script>");
document.writeln("<script type='text/javascript' src='js/collisionHandler.js'></script>");

function Engine() {
    "use strict";
    // canvas which is used by the engine
    this.canvas = null;

    this.adultShowing = true;

    // array which contains all the teeth for an odontograma
    this.mouth = [];

    // array which holds all the spaces between teeth
    this.spaces = [];

    // array for an adult odontograma
    this.odontAdult = [];

    // spaces for a adult odontograma
    this.odontSpacesAdult = [];

    // array for a child odontograma
    this.odontChild = [];

    // spaces for a child odontograma
    this.odontSpacesChild = [];

    // renderer which will render everything on a canvas
    this.renderer = new Renderer();

    // helper to create odontograma
    this.odontogramaGenerator = new OdontogramaGenerator();

    // helper for handeling collision
    this.collisionHandler = new CollisionHandler();

    // settings for application
    this.settings = new Settings();

    // constants for application
    this.constants = new Constants();

    // value of the selected damage which should be added or removed
    this.selectedDamage = 0;

    // x position of the mouse pointer
    this.cursorX = 0;

    // y position of the mouse pointer
    this.corsorY = 0;

    // flag to toggle multiselection on or off
    this.multiSelect = false;

    // array to hold values for multiselection. When selecting 
    // a range of teeth
    this.multiSelection = [];

    this.currentType = 0;

    this.preview = false;

    this.printPreviewPositionChange = 190;

    this.observations = "";

    this.specifications = "";

    this.patient = "";

    this.treatmentNumber = "";

    this.treatmentData = {};

    this.menuItems = [];

    this.buttons = []

    this.adult = new MenuItem()


    this.child = new MenuItem()

    this.clear = new MenuItem()

}

/**
 * Method to set the canvas for the engine.
 * @param {type} canvas the canvas which will be used for drawing
 * @returns {undefined}
 */
Engine.prototype.setCanvas = function (canvas) {
    "use strict";
    console.log("Engine: setting canvas: " + canvas);
    console.log("Engine: canvas size (" + canvas.width + ", " + canvas.height + ")");
    this.canvas = canvas;
    this.renderer.init(this.canvas);
};

/**
 * Helper method to get the real x position of mouse
 * @param {type} event mouse event containing mouse position
 * @returns {Number} the x position of the mouse
 */
Engine.prototype.getXpos = function (event) {
    "use strict";
    var boundingRect = this.canvas.getBoundingClientRect();

    return Math.round(event.clientX - (boundingRect.left));
};

/**
 * Helper method to get the real y position of mouse
 * @param {type} event mouse event containing mouse position
 * @returns {Number} the y position of the mouse
 */
Engine.prototype.getYpos = function (event) {
    "use strict";
    var boundingRect = this.canvas.getBoundingClientRect();

    return Math.round(event.clientY - (boundingRect.top));
};

/**
 * Method to prepare the engine
 * @returns {undefined}
 */
Engine.prototype.init = function () {
    "use strict";
    this.collisionHandler.setConstants(this.constants);

    // set up the odontograma
    this.odontogramaGenerator.setEngine(this);

    this.odontogramaGenerator.setSettings(this.settings);

    this.odontogramaGenerator.setConstants(this.constants);

    this.odontogramaGenerator.prepareOdontogramaAdult(this.odontAdult,
        this.odontSpacesAdult, this.canvas);

    this.odontogramaGenerator.prepareOdontogramaChild(this.odontChild,
        this.odontSpacesChild, this.canvas);

    this.mouth = this.odontAdult;

    this.spaces = this.odontSpacesAdult;

    //this.createMenu()


    //this.adult = new MenuItem();
    //this.adult.setUp(10, 150, 75, 20);
    //this.adult.textBox.text = "Adult";
    //this.adult.active = true;
    //this.buttons.push(this.adult);

    // this.child = new MenuItem();
    // this.child.setUp(90, 150, 75, 20);
    // this.child.textBox.text = "Child";
    // this.child.active = false;
    // this.buttons.push(this.child);

    // this.clear = new MenuItem()
    // this.clear = new MenuItem();
    // this.clear.setUp((this.canvas.width-10) - 76, 150, 75, 20);
    // this.clear.textBox.text = "Reset";
    // this.clear.active = false;
    // this.buttons.push(this.clear);

};


/**
 * Method for updating the engine
 * @returns {undefined}
 */
Engine.prototype.update = function () {
    "use strict";
    this.renderer.clear(this.settings);

    if (!this.preview) {
        this.renderer.clear(this.settings);

        // نرسم فقط الأسنان والمسطحات الفارغة
        this.renderer.render(this.mouth,    this.settings, this.constants);
        this.renderer.render(this.spaces,   this.settings, this.constants);

        if (this.settings.DEBUG) {
            this.renderer.renderText("DEBUG MODE", 2, this.canvas.height, "#000000");
            this.renderer.renderText("X: " + this.cursorX + ", Y: " + this.cursorY,
                                     128, this.canvas.height, "#000000");
            this.renderer.renderText("Selected Damage : " + this.selectedDamage,
                                     220, this.canvas.height, "#000000");
        }

    } else {
        this.printPreview();
    }
};

/**
 * Method to remove all the highlight from all the teeth
 * @returns {undefined}
 */
Engine.prototype.removeHighlight = function () {
    "use strict";
    for (var i = 0; i < this.mouth.length; i++) {
        this.mouth[i].highlight = false;
    }

};

/**
 * Method to highlight all the teeth which are marked when multiselected
 * @param {type} tooth the tooth which should be highlighted
 * @returns {undefined}
 */
Engine.prototype.highlightMultiSelection = function (tooth) {
    "use strict";
    console.log("Highlighting multiselection");
    try {

        // only highlight if we the selection is at least 1
        if (this.multiSelection.length > 0) {

            // reset the highlighting
            for (var i = 0; i < this.mouth.length; i++) {
                this.mouth[i].highlight = false;
                this.mouth[i].highlightColor = this.settings.COLOR_HIGHLIGHT;
            }

            var tooth1 = this.multiSelection[0];

            // check if these teeth are same types
            if (tooth1.type === tooth.type) {

                // get indices for both teeth
                var index1 = this.getIndexForTooth(tooth1);
                var index2 = this.getIndexForTooth(tooth);

                var begin = Math.min(index1, index2);
                var end = Math.max(index1, index2);

                // highlight the teeth between begin and end
                for (var i = begin; i <= end; i++) {

                    this.mouth[i].highlight = true;
                }

                // some damages can only have 2 items in multiselection
                if (this.selectedDamage === this.constants.TRANSPOSICION_LEFT) {

                    // if count of selection for this damage (max 2) then
                    // change the highlight color, to show that this selection
                    // is not allowed
                    if ((end - begin) > 1) {

                        for (var i = begin; i <= end; i++) {

                            this.mouth[i].highlightColor = this.settings.COLOR_HIGHLIGHT_BAD;
                        }
                    }

                }

            }

            // repaint
            this.update();
        }

    } catch (error) {
        console.log("Engine highlightMultiSelection e: " + error.message);
    }

};


/**
 * Method to reset the multiselection - deactivate multiselection
 * @returns {undefined}
 */
Engine.prototype.resetMultiSelect = function () {
    "use strict";
    this.selectedDamage = "0";
    this.multiSelect = false;
    this.multiSelection.length = 0;
    this.removeHighlight();
    this.update();
};

/**
 * Method to get the index for a tooth
 * @param {type} tooth the tooth to find the index of
 * @returns {Number} index of the tooth, -1 if not found
 */
Engine.prototype.getIndexForTooth = function (tooth) {
    "use strict";
    var index = -1;

    for (var i = 0; i < this.mouth.length; i++) {

        if (this.mouth[i].id === tooth.id) {
            index = i;
            break;
        }
    }

    return index;

};

/**
 * Method to handle multiselection. this method is called when multiselect contains
 * 2 items, start and end. This method will add or remove damages from the teeth
 * which have been selected.
 * @returns {void}
 */
Engine.prototype.handleMultiSelection = function () {
    "use strict";
    // only handle multiselect when 2 teeth have been selected
    // start and end
    if (this.multiSelection.length === 2) {


        let tooth1 = this.multiSelection[0];
        let tooth2 = this.multiSelection[1];


        // get the indices for the teeth which have been selected
        var index1 = this.getIndexForTooth(tooth1);
        var index2 = this.getIndexForTooth(tooth2);

        var valid = true;

        // make sure that we dont select the same tooth 2 times
        if (index1 === index2) {
            valid = false;
        }

        // make sure that both teeth are same type, upper or lower mouth
        if (tooth1.type !== tooth2.type) {
            valid = false;
        }

        // only toggle damages if everyhting is okey
        if (valid) {

            var start = Math.min(index1, index2);
            var end = Math.max(index1, index2);

            // check which damage should be added or removed from the selected
            // teeth
            if (this.selectedDamage === this.constants.ORTODONTICO_FIJO_END) {

                this.mouth[start].toggleDamage(this.constants.ORTODONTICO_FIJO_END,
                    this.constants);

                this.mouth[end].toggleDamage(this.constants.ORTODONTICO_FIJO_END,
                    this.constants);

                for (var i = start + 1; i <= end - 1; i++) {

                    this.mouth[i].toggleDamage(this.constants.ORTODONTICO_FIJO_CENTER,
                        this.constants);

                }

            } else if (this.selectedDamage === this.constants.PROTESIS_FIJA_LEFT) {

                this.mouth[start].toggleDamage(this.constants.PROTESIS_FIJA_RIGHT,
                    this.constants);

                this.mouth[end].toggleDamage(this.constants.PROTESIS_FIJA_LEFT,
                    this.constants);

                for (var i = start + 1; i <= end - 1; i++) {

                    this.mouth[i].toggleDamage(this.constants.PROTESIS_FIJA_CENTER,
                        this.constants);

                }

            } else if (this.selectedDamage === this.constants.TRANSPOSICION_LEFT) {

                if (end - start === 1) {

                    this.mouth[start].toggleDamage(this.constants.TRANSPOSICION_LEFT,
                        this.constants);

                    this.mouth[end].toggleDamage(this.constants.TRANSPOSICION_RIGHT,
                        this.constants);
                }

            }

        }

        // reset multiselection when it is finished
        this.multiSelection.length = 0;

        this.removeHighlight();

        this.update();
    }

};

/**
 * Method to add items to a list of selected items
 * @param {type} tooth the tooth to add to the list
 * @returns {undefined}
 */
Engine.prototype.addToMultiSelection = function (tooth) {
    "use strict";
    this.multiSelection.push(tooth);

    if (this.multiSelection.length === 2) {
        this.handleMultiSelection();
    }

};

/**
 * Method to check if a string is alphanumeric
 * @param {type} input the text to check
 * @returns {Boolean} true if aphanumeric, else false
 */
Engine.prototype.isAlphanumeric = function (input) {
    "use strict";
    var valid = false;

    var letters = /^[0-9a-zA-Z]+$/;

    if (input.match(letters)) {
        valid = true;

    }

    return valid;
};


/**
 * Method to add text to a textbox. This method only allows alphanumeric values
 * to be added to a texbox
 * @param {type} textBox for the text
 * @param {type} text to add to the textbox
 * @returns {void} 
 */
Engine.prototype.setTextToTextBox = function (textBox, text) {
    "use strict";
    if (text !== null) {
        if (text.length < 4) {

            if (this.isAlphanumeric(text)) {
                textBox.setNote(text);
            } else if (text === "") {
                textBox.setNote(text);
            }
        }
    }
};

/**
 * Method to handle when there is a mouse click on a textbox
 * the method prompts the user to input a text.
 * @param {type} textBox the textbox which has been clicked
 * @returns {void}
 */
// Engine.prototype.onTextBoxClicked = function (textBox) {
//     "use strict";
//     var message = "Add 3 letter dental code.";

//     var text = prompt(message, "");

//     this.setTextToTextBox(textBox, text);

// };

/**
 * Method to handle mouse right click on a space
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.mouseRightClickSpace = function (event) {
    "use strict";

    var shouldUpdate = false;

    for (var i = 0; i < this.spaces.length; i++) {
        // check collision for current space
        if (this.spaces[i].checkCollision(
            this.getXpos(event),
            this.getYpos(event))) {

            this.spaces[i].popDamage();

            shouldUpdate = true;
        }
    }

    // only update if something new has occurred
    if (shouldUpdate) {
        this.update();
    }

};

/**
 * Method to handle a right mouse click on a tooth
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.mouseRightClickTooth = function (event) {
    "use strict";

    var shouldUpdate = false;

    // loop through all teeth
    for (var i = 0; i < this.mouth.length; i++) {

        // check if there is a collision with the textBox
        if (this.mouth[i].textBox.rect.checkCollision(this.getXpos(event),
            this.getYpos(event))) {

            this.mouth[i].textBox.text = "";

        }

        // check collision for current tooth
        if (this.mouth[i].rect.checkCollision(
            this.getXpos(event),
            this.getYpos(event))) {

            this.mouth[i].popDamage();
            shouldUpdate = true;
        }


        // check if there is a collision with one of the tooth surfaces
        for (var j = 0; j < this.mouth[i].checkBoxes.length; j++) {

            if (this.mouth[i].checkBoxes[j].checkCollision(
                this.getXpos(event),
                this.getYpos(event))) {


                // handle collision with surface    
                this.mouth[i].checkBoxes[j].state = 0;

                shouldUpdate = true;
            }
        }
    }

    // only update if something new has occurred
    if (shouldUpdate) {
        this.update();
    }
};

/**
 * Method to handle mouse click event, when the spaces between the teeth 
 * are in the forground.
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.mouseClickSpace = function (event) {
    "use strict";
    var shouldUpdate = false;

    for (var i = 0; i < this.spaces.length; i++) {
        // check collision for current space
        if (this.spaces[i].checkCollision(
            this.getXpos(event),
            this.getYpos(event))) {

            this.collisionHandler.handleCollision(
                this.spaces[i],
                this.selectedDamage);

            shouldUpdate = true;
        }
    }

    // only update if something new has occurred
    if (shouldUpdate) {
        this.update();
    }

};

/**
 * Method to handle mouse click event when the teeth are in the foreground
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.mouseClickTooth = function (event) {
    "use strict";
    var shouldUpdate = false;

    // loop through all teeth
    for (var i = 0; i < this.mouth.length; i++) {

        // check if there is a collision with the textBox
        if (this.mouth[i].textBox.rect.checkCollision(this.getXpos(event),
            this.getYpos(event))) {

            if (this.currentType === 0) {
                this.onTextBoxClicked(this.mouth[i].textBox);
            }
        }

        // check collision for current tooth
        if (this.mouth[i].rect.checkCollision(
            this.getXpos(event),
            this.getYpos(event))) {

            // if we are in multi select mode
            // add this tooth to multi select list
            if (this.multiSelect) {

                this.addToMultiSelection(this.mouth[i]);

            } else {

                if (this.currentType === 0) {

                    // handle collision with tooth
                    this.collisionHandler.handleCollision(
                        this.mouth[i],
                        this.selectedDamage);

                    shouldUpdate = true;

                } else {

                    var d = new Object();

                    d.tooth = this.mouth[i].id;
                    d.damage = "";
                    d.diagnostic = this.selectedDamage;
                    d.surface = "X";
                    d.note = "";

                    this.createDiagnostico(d);

                }
            }
        }

        // check if there is a collision with one of the tooth surfaces
        for (var j = 0; j < this.mouth[i].checkBoxes.length; j++) {

            if (this.mouth[i].checkBoxes[j].checkCollision(
                this.getXpos(event),
                this.getYpos(event))) {

                console.log("Collision Checkbox : " + this.selectedDamage)

                if (this.currentType === 0) {

                    console.log("Collision Checkbox : " + this.selectedDamage)
                    // handle collision with surface    
                    this.collisionHandler.handleCollisionCheckBox(
                        this.mouth[i].checkBoxes[j],
                        this.selectedDamage);

                    shouldUpdate = true;

                } else {

                    var d = new Object();

                    d.tooth = "0";
                    d.damage = "";
                    d.diagnostic = this.selectedDamage;
                    d.surface = this.mouth[i].checkBoxes[j].id;
                    d.note = "";

                    this.createDiagnostico(d);

                }
            }
        }
    }


    // only update if something new has occurred
    if (shouldUpdate) {
        this.update();
    }

};


/**
 * Method to handle mouse click event when the teeth are in the foreground
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.mouseClickMenu = function (event) {
    "use strict";
    var shouldUpdate = false;

    // loop through all teeth
    for (var i = 0; i < this.menuItems.length; i++) {

        // check collision for current tooth
        if (this.menuItems[i].rect.checkCollision(
            this.getXpos(event),
            this.getYpos(event))) {

            if (this.menuItems[i].active) {
                for (var j = 0; j < this.menuItems.length; j++) {
                    this.menuItems[j].active = false;
                }
                this.menuItems[i].active = false;
                this.selectedDamage = 0;
            } else {
                for (var j = 0; j < this.menuItems.length; j++) {
                    this.menuItems[j].active = false;
                }
                this.menuItems[i].active = true;
                this.selectedDamage = this.menuItems[i].id;
            }

            this.setDamage(this.selectedDamage);
            console.log("Mouse click. MenuItem: ");


            shouldUpdate = true;
        }
    }

    // only update if something new has occurred
    if (shouldUpdate) {
        this.update();
    }

};


Engine.prototype.mouseClickControls = function (event) {
    "use strict";
    var shouldUpdate = false;


    if (this.adult.rect.checkCollision(
        this.getXpos(event),
        this.getYpos(event))) {

        this.adult.active = true;
        this.child.active = false;
        shouldUpdate = true;

        this.adultShowing = true;
        console.log("Setting odontograma to adult");
        this.mouth = this.odontAdult;
        this.spaces = this.odontSpacesAdult;
        this.update();
    }


    if (this.child.rect.checkCollision(
        this.getXpos(event),
        this.getYpos(event))) {

        this.adult.active = false;
        this.child.active = true;
        shouldUpdate = true;

        this.adultShowing = false;
        console.log("Setting odontograma to child");
        this.mouth = this.odontChild;
        this.spaces = this.odontSpacesChild;
        this.update();
    }


    if (this.clear.rect.checkCollision(
        this.getXpos(event),
        this.getYpos(event))) {

        shouldUpdate = true;
        this.reset();
    }


    if (shouldUpdate) {
        this.update();
    }

};

/**
 * Event handler for when the mouse is clicked
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.onMouseClick = function (event) {
    "use strict";

    console.log("Mouse click. which: " + event.which);

    if (!this.preview) {


        if (event.which === 3) {

            // check what is in foreground
            if (this.settings.HIHGLIGHT_SPACES) {

                this.mouseRightClickSpace(event);

            } else {

                this.mouseRightClickTooth(event);

            }

        } else if (event.which === 1) {
            // check what is in foreground
            if (this.settings.HIHGLIGHT_SPACES) {

                this.mouseClickSpace(event);

            } else {

                this.mouseClickTooth(event);

            }

            this.mouseClickMenu(event);
            this.mouseClickControls(event);

        }
    }

};

/**
 * Method to get the x and y coordinates of the mouse cursor
 * @param {type} event mouse move event
 * @returns {undefined}
 */
Engine.prototype.followMouse = function (event) {
    "use strict";

    this.cursorX = this.getXpos(event);
    this.cursorY = this.getYpos(event);

    this.update();
};

/**
 * Method to handle mouse move event when spaces between teeth are in foreground
 * @param {type} event mouse move envent
 * @returns {void}
 */
Engine.prototype.mouseMoveSpaces = function (event) {
    "use strict";

    for (var i = 0; i < this.spaces.length; i++) {

        var update = false;

        if (this.spaces[i].checkCollision(this.getXpos(event),
            this.getYpos(event))) {

            this.spaces[i].onTouch(true);

            update = true;

        } else {

            this.spaces[i].onTouch(false);
        }
    }

    if (update) {
        this.update();
    }
};

/**
 * Method to handle mouse move event, when teeth are in forground
 * @param {type} event mouse move event
 * @returns {void}
 */
Engine.prototype.mouseMoveTeeth = function (event) {
    "use strict";

    for (var i = 0; i < this.mouth.length; i++) {

        if (this.mouth[i].textBox.rect.checkCollision(this.getXpos(event),
            this.getYpos(event))) {

            this.mouth[i].textBox.touching = true;

        } else {

            this.mouth[i].textBox.touching = false;

        }

        if (this.mouth[i].checkCollision(this.getXpos(event),
            this.getYpos(event))) {
            this.mouth[i].onTouch(true);

            if (this.multiSelect) {

                if (this.multiSelection.length > 0) {
                    this.highlightMultiSelection(this.mouth[i]);
                }
            }

        } else {
            this.mouth[i].onTouch(false);
        }

        for (var j = 0; j < this.mouth[i].checkBoxes.length; j++) {

            if (this.mouth[i].checkBoxes[j].checkCollision(
                this.getXpos(event), this.getYpos(event))) {
                this.mouth[i].checkBoxes[j].touching = true;

            } else {
                this.mouth[i].checkBoxes[j].touching = false;
            }
        }
    }
};


Engine.prototype.mouseMoveMenuItems = function (event) {
    "use strict";

    for (var i = 0; i < this.menuItems.length; i++) {

        var update = false;

        if (this.menuItems[i].rect.checkCollision(this.getXpos(event),
            this.getYpos(event))) {

            this.menuItems[i].highlight = true;

            update = true;

        } else {

            this.menuItems[i].highlight = false;
        }
    }

    if (this.child.rect.checkCollision(this.getXpos(event),
        this.getYpos(event))) {
        this.child.highlight = true;
        update = true;
    } else {
        this.child.highlight = false;
    }


    if (this.adult.rect.checkCollision(this.getXpos(event),
        this.getYpos(event))) {
        this.adult.highlight = true;
        update = true;
    } else {
        this.adult.highlight = false;
    }

    if (this.clear.rect.checkCollision(this.getXpos(event),
        this.getYpos(event))) {
        this.clear.highlight = true;
        update = true;
    } else {
        this.clear.highlight = false;
    }


    if (update) {
        this.update();
    }
};

/**
 * Event handler for when the mouse is moved
 * @param {type} event mouse click event
 * @returns {void}
 */
Engine.prototype.onMouseMove = function (event) {
    "use strict";

    if (!this.preview) {

        // are the spaces in forground
        if (this.settings.HIHGLIGHT_SPACES) {

            this.mouseMoveSpaces(event);

        } else {

            this.mouseMoveTeeth(event);

        }

        this.mouseMoveMenuItems(event);
    }

    // update mouse cooridnates
    this.followMouse(event);

};

/*'
 * Method to reset the odontograma
 * @returns {undefined}
 */
Engine.prototype.reset = function () {
    "use strict";
    // reset all teeth
    for (var i = 0; i < this.mouth.length; i++) {
      const t = this.mouth[i];
  
      //1) Cancel all damages & checkbox states

      t.damages.length = 0;
      t.textBox.text = "";
      for (var j = 0; j < t.checkBoxes.length; j++) {
        t.checkBoxes[j].state = 0;
      }
  
      //2) NEW: Remove the logical selection if it exists

      if (typeof t.toggleSelected === "function") {
        t.toggleSelected(false);   // أو  t.selected = false; حسب الـ Tooth class
      }
    }
  
    // reset all spaces
    for (var i = 0; i < this.spaces.length; i++) {
      this.spaces[i].damages.length = 0;
    }
  
    // repaint
    this.update();
  };
  

/**
 * Method to get all the data from the engine.
 * Struct for a damage is the following
 * 
 * struct damage{
 *      tooth: int;
 *      damage: int;
 *      surface: String;
 *      note: String;
 * }
 * @returns {array} list of all the damages which exists in the odontograma
 */
Engine.prototype.getData = function () {
    "use strict";
    var list = Array();


    // First: get data for adult odontograp

    // Get data for all the spaces in the odontograma
    for (var i = 0; i < this.odontSpacesAdult.length; i++) {

        var t1 = this.odontSpacesAdult[i];

        for (var j = 0; j < t1.damages.length; j++) {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = t1.damages[j].id;
            d.diagnostic = "";
            d.surface = "0";
            d.note = "";

            list.push(d);
        }

    }

    // get all data from the teeth in the odontograma
    for (var i = 0; i < this.odontAdult.length; i++) {

        var t1 = this.odontAdult[i];

        // get the notes from the text boxes
        if (t1.textBox.text !== "") {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = "";
            d.diagnostic = "";
            d.surface = "0";
            d.note = t1.textBox.text;

            list.push(d);

        }

        // get the damages registered for the tooth
        for (var j = 0; j < t1.damages.length; j++) {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = "" + t1.damages[j].id;
            d.diagnostic = "";
            d.surface = "0";
            d.note = "";

            list.push(d);
        }

        // get data for the checkboxes (surfaces) for current tooth
        for (var j = 0; j < t1.checkBoxes.length; j++) {

            if (t1.checkBoxes[j].state !== 0) {
                var d = new Object();


                d.tooth = t1.id;
                d.damage = t1.checkBoxes[j].state;
                d.diagnostic = "";
                d.surface = t1.checkBoxes[j].id;
                d.note = t1.textBox.text;

                list.push(d);
            }
        }
    }

    // Second: get data for child odontograp

    // Get data for all the spaces in the odontograma
    for (var i = 0; i < this.odontSpacesChild.length; i++) {

        var t1 = this.odontSpacesChild[i];

        for (var j = 0; j < t1.damages.length; j++) {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = t1.damages[j].id;
            d.diagnostic = "";
            d.surface = "0";
            d.note = "";

            list.push(d);
        }

    }

    // get all data from the teeth in the odontograma
    for (var i = 0; i < this.odontChild.length; i++) {

        var t1 = this.odontChild[i];

        // get the notes from the text boxes
        if (t1.textBox.text !== "") {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = "";
            d.diagnostic = "";
            d.surface = "0";
            d.note = t1.textBox.text;

            list.push(d);

        }

        // get the damages registered for the tooth
        for (var j = 0; j < t1.damages.length; j++) {

            var d = new Object();

            d.tooth = t1.id;
            d.damage = "" + t1.damages[j].id;
            d.diagnostic = "";
            d.surface = "0";
            d.note = "";

            list.push(d);
        }

        // get data for the checkboxes (surfaces) for current tooth
        for (var j = 0; j < t1.checkBoxes.length; j++) {

            if (t1.checkBoxes[j].state !== 0) {
                var d = new Object();


                d.tooth = t1.id;
                d.damage = t1.checkBoxes[j].state;
                d.diagnostic = "";
                d.surface = t1.checkBoxes[j].id;
                d.note = t1.textBox.text;

                list.push(d);
            }
        }
    }

    return list;
};

/**
 * Method to save the odontograma as an image file
 * @returns {void}
 */
Engine.prototype.save = function () {
    "use strict";

    // save image as png
    var link = document.createElement('a');

    // create a unique name
    var name = Date.now() + ".png";

    link.download = name;

    // Create an image stream of the canvas
    link.href = this.canvas.toDataURL("image/png")
        .replace("image/png", "image/octet-stream");


    // download the image
    link.click();

};

/*
 * Helper function to map keyboard keys into usable values Just for debugging
 * @param {type} event keyDown event
 * @returns {Number} 
 */
Engine.prototype.keyMapper = function (event) {
    "use strict";
    var value = 0;

    if (event.key === "q") {
        value = 10;
    } else if (event.key === "w") {
        value = 11;
    } else if (event.key === "e") {
        value = 12;
    } else if (event.key === "r") {
        value = 13;
    } else if (event.key === "t") {
        value = 14;
    } else if (event.key === "y") {
        value = 15;
    } else if (event.key === "u") {
        value = 16;
    } else if (event.key === "i") {
        value = 17;
    } else if (event.key === "o") {
        value = 18;
    } else if (event.key === "p") {
        value = 19;
    } else if (event.key === "a") {
        value = 20;
    } else if (event.key === "s") {
        value = 21;
    } else if (event.key === "d") {
        value = 22;
    } else if (event.key === "f") {
        value = 23;
    } else if (event.key === "g") {
        value = 24;
    } else if (event.key === "h") {
        value = 25;
    } else if (event.key === "j") {
        value = 27;
    } else if (event.key === "k") {
        value = 28;
    } else if (event.key === "l") {
        value = 29;
    } else if (event.key === "x") {
        value = 30;
    } else if (event.key === "c") {
        value = 31;
    } else if (event.key === "b") {
        value = 32;
    } else if (event.key === "n") {
        value = 34;
    } else if (event.key === "m") {
        value = "DG990";
    }

    return value;
};

/**
 * Event handler for when a keyboard button is clicked.
 * @param {type} event button event
 * @returns {void}
 */
Engine.prototype.onButtonClick = function (event) {
    "use strict";
    console.log("key " + event.key);

    if (event.key === "p") {
        this.print();
    }


    if (event.key === "v") {

        var data = this.getData();

        console.log("Data length: " + data.length);

        for (var i = 0; i < data.length; i++) {

            console.log("Data[" + i + "]: " + data[i].tooth + ", "
                + data[i].damage + ", " + data[i].surface + ", "
                + data[i].note);

        }

    } else if (event.key === "-") {

        this.togglePrintPreview();

    } else {

        if (event.key === ".") {

            this.currentType = 1;

            this.selectedDamage = "kb90";

        } else {

            this.currentType = 0;

            var damage;

            let key = Number(event.key);

            if (isNaN(key)) {
                damage = this.keyMapper(event);
            } else {
                damage = key;
            }

            this.setDamage(damage);

            if (event.key === "z") {
                this.selectedDamage = 0;
                this.reset();
            }

            // key combination Ctrl + Q to activate debug mode
            if ((event.which === 81 || event.keyCode === 81) && event.ctrlKey) {
                this.settings.DEBUG = !this.settings.DEBUG;

                this.update();
            }

            // key combination Ctrl + W to save the canvas as an image file
            if ((event.which === 81 || event.keyCode === 81) && event.shiftKey) {
                this.settings.DEBUG = !this.settings.DEBUG;

                this.save();
            }

            if (event.key === "ArrowLeft") {

                this.adultShowing = true;
                console.log("Setting odontograma to adult");
                this.mouth = this.odontAdult;
                this.spaces = this.odontSpacesAdult;
                this.update();

            }

            if (event.key === "ArrowRight") {

                this.adultShowing = false;
                console.log("Setting odontograma to child");
                this.mouth = this.odontChild;
                this.spaces = this.odontSpacesChild;
                this.update();
            }
        }
    }
};

/**
 * Method to set the damage which the engine should toggle on or off
 * @param {type} damage id of the damge
 * @returns {void}
 */
Engine.prototype.setDamage = function (damage) {
    "use strict";
    this.multiSelect = false;
    this.multiSelection.length = 0;

    console.log("Engine setting damage: " + damage);

    this.selectedDamage = parseInt(damage, 10) || 0;

    if (this.selectedDamage === this.constants.TRANSPOSICION_LEFT) {
        this.multiSelect = true;
        this.multiSelection.length = 0;

    }

    if (this.selectedDamage === this.constants.ORTODONTICO_FIJO_END) {
        this.multiSelect = true;
        this.multiSelection.length = 0;
    }

    if (this.selectedDamage === this.constants.PROTESIS_FIJA_LEFT) {
        this.multiSelect = true;
        this.multiSelection.length = 0;
    }

    if (this.selectedDamage === this.constants.SUPER_NUMERARIO) {

        this.settings.HIHGLIGHT_SPACES = true;
        this.update();
    }

    if (this.selectedDamage === this.constants.DIASTEMA) {

        this.settings.HIHGLIGHT_SPACES = true;
        this.update();
    }

    if (this.selectedDamage !== this.constants.DIASTEMA &&
        this.selectedDamage !== this.constants.SUPER_NUMERARIO) {

        this.settings.HIHGLIGHT_SPACES = false;
        this.update();
    }

    this.selectedDamage = damage;
};

/**
 * Method to change odontograma view
 * @param {type} which type of odontograma "0" = adult
 * @returns {void}
 */
Engine.prototype.changeView = function (which) {
    "use strict";
    if (which === "1") {

        this.adultShowing = false;
        this.mouth = this.odontChild;
        this.spaces = this.odontSpacesChild;
        this.update();


    } else {

        this.adultShowing = true;
        this.mouth = this.odontAdult;
        this.spaces = this.odontSpacesAdult;
        this.update();

    }

};

/**
 * Method to start the engine. Methods gets called
 * when all assets have been loaded.
 * @returns {void}
 */
Engine.prototype.start = function () {
    "use strict";
    var self = this;

    // show splash screen for 3 seconds 
    // then continue
    setTimeout(function () {
        self.update();
    }, 1500);

};

/**
 * Method to get a tooth by its id
 * @param {type} id of the tooth
 * @returns {Tooth} tooth with the specified id. Undefined if the tooth does
 * not exist
 */
Engine.prototype.getToothById = function (id) {
    "use strict";
    var tooth;

    for (var i = 0; i < this.mouth.length; i++) {

        if (this.mouth[i].id === id) {

            tooth = this.mouth[i];
            break;

        }
    }

    return tooth;

};

/**
 * Method to get a space, between 2 teeths, by id
 * @param {type} id of the space
 * @returns {Tooth} the space for the id
 */
Engine.prototype.getSpaceById = function (id) {
    "use strict";
    var space;

    for (var i = 0; i < this.spaces.length; i++) {

        if (this.spaces[i].id === id) {

            space = this.spaces[i];
            break;

        }
    }

    return space;

};

/**
 * Method to load damages to odontograma from external source
 * @param {type} tooth id of the tooth which has the damage
 * @param {type} damage id of the damage to add
 * @param {type} surface id of the surface to add damage, empty if no surface
 * @param {type} note text to add to textbox for tooth, empty if no note
 * @returns {undefined}
 */
Engine.prototype.load = function (tooth, damage, surface, note) {
    "use strict";
    // check if we should add damage to a tooth
    if (surface === "0") {

        // if id is less than 1000 then we have to find a tooth
        if (tooth < 1000) {

            var t = this.getToothById(tooth);

            this.collisionHandler.handleCollision(t, damage);

            this.setTextToTextBox(t.textBox, note);

        } else {

            // if the id is greater than 1000
            // then we have to find a space
            this.collisionHandler.handleCollision(this.getSpaceById(tooth), damage);
        }


    } else {

        // the damage should be added to a surface of a tooth
        var surfaceId = tooth + "_" + surface;

        var t = this.getToothById(tooth);
        var surface = t.getSurfaceById(surfaceId);

        this.collisionHandler.handleCollisionCheckBox(surface, damage);

        this.setTextToTextBox(t.textBox, note);

    }

};

/**
 * Method to pass a comma seperated string for loading data
 * fomat of string: toothId,damageId,surface,note,...toothId,damageId,surface,note
 * @param {type} dataArray commea seperated string
 * @returns {void}
 */
Engine.prototype.setDataSource = function (dataArray) {
    "use strict";
    var res = dataArray.split(",");

    var i = 0;
    while (i < res.length) {

        // loop through all and add damage
        this.load(Number(res[i]), Number(res[i + 1]), res[i + 2], res[i + 3]);

        i = i + 4;
    }

};

Engine.prototype.createDiagnostico = function (diagnostico) {

    console.log("Diagnostico: " + JSON.stringify(diagnostico));
};

/**
 * Method to toggle print preview on / off
 * @returns {undefined}
 */
Engine.prototype.togglePrintPreview = function () {

    this.preview = !this.preview;

    if (!this.preview) {
        this.hidePrintPreview();
    } else {
        this.showPrintPreview();
    }

};

/**
 * Method to to display a print preview of the odontogram
 * @returns {void}
 */
Engine.prototype.showPrintPreview = function () {

    // reset the size of the canvas
    this.renderer.setCanvasSize(this.renderer.width, 1420);

    console.log("Print preview");

    // reset positions

    for (var i = 0; i < this.odontAdult.length; i++) {

        if (this.odontAdult[i].type === 1) {
            this.odontAdult[i].moveUpDown(this.printPreviewPositionChange * 2 + 120);
            this.odontAdult[i].textBox.rect.y += 20;

        } else {
            this.odontAdult[i].moveUpDown(120);
            this.odontAdult[i].textBox.rect.y -= 20;
        }

    }

    for (var i = 0; i < this.odontSpacesAdult.length; i++) {

        if (this.odontSpacesAdult[i].type === 1) {
            this.odontSpacesAdult[i].moveUpDown(this.printPreviewPositionChange * 2 + 120);
        } else {
            this.odontSpacesAdult[i].moveUpDown(120);
        }

    }

    for (var i = 0; i < this.odontChild.length; i++) {

        this.odontChild[i].moveUpDown(this.printPreviewPositionChange + 120);

        if (this.odontChild[i].type === 0) {
            this.odontChild[i].textBox.rect.y -= this.printPreviewPositionChange;
        } else {
            this.odontChild[i].textBox.rect.y += this.printPreviewPositionChange;
        }

    }

    for (var i = 0; i < this.odontSpacesChild.length; i++) {

        this.odontSpacesChild[i].moveUpDown(this.printPreviewPositionChange + 120);

    }

    // realligne all teeth and damages
    for (var i = 0; i < this.odontAdult.length; i++) {
        this.odontAdult[i].refresh(this.constants);
    }

    for (var i = 0; i < this.odontChild.length; i++) {
        this.odontChild[i].refresh(this.constants);
    }


    this.update();

};

/**
 * Method to hide print preview
 * @returns {void}
 */
Engine.prototype.hidePrintPreview = function () {

    // update size of the canvas
    this.renderer.setCanvasSize(this.renderer.width, this.renderer.height);

    console.log("Print preview");

    // update the positions of all the data in the odontoram

    for (var i = 0; i < this.odontAdult.length; i++) {

        if (this.odontAdult[i].type === 1) {
            this.odontAdult[i].moveUpDown(-this.printPreviewPositionChange * 2 - 120);
            this.odontAdult[i].textBox.rect.y -= 20;
        } else {
            this.odontAdult[i].moveUpDown(-120);
            this.odontAdult[i].textBox.rect.y += 20;
        }

    }

    for (var i = 0; i < this.odontSpacesAdult.length; i++) {

        if (this.odontSpacesAdult[i].type === 1) {
            this.odontSpacesAdult[i].moveUpDown(-this.printPreviewPositionChange * 2 - 120);
        } else {
            this.odontSpacesAdult[i].moveUpDown(-120);
        }
    }

    for (var i = 0; i < this.odontChild.length; i++) {

        this.odontChild[i].moveUpDown(-this.printPreviewPositionChange - 120);

        if (this.odontChild[i].type === 0) {
            this.odontChild[i].textBox.rect.y += this.printPreviewPositionChange;
        } else {
            this.odontChild[i].textBox.rect.y -= this.printPreviewPositionChange;
        }
    }

    for (var i = 0; i < this.odontSpacesChild.length; i++) {

        this.odontSpacesChild[i].moveUpDown(-this.printPreviewPositionChange - 120);

    }

    for (var i = 0; i < this.odontAdult.length; i++) {
        this.odontAdult[i].refresh();
    }

    for (var i = 0; i < this.odontChild.length; i++) {
        this.odontChild[i].refresh();
    }

    this.update();

};


Engine.prototype.loadPatientData = function (office, patient, number,
    treatmentNumber, treatmentDate,
    dentist, observations, specs) {

    this.treatmentData.office = office;
    this.treatmentData.patient = patient;
    this.treatmentData.number = number;
    this.treatmentData.treatmentNumber = treatmentNumber;
    this.treatmentData.treatmentDate = treatmentDate;
    this.treatmentData.dentist = dentist;
    this.treatmentData.observations = observations;
    this.treatmentData.specs = specs;

};

Engine.prototype.createHeader = function () {

    var seperation = 18;

    this.renderer.renderTextCenter16("Odontogram",
        this.renderer.width / 2,
        seperation,
        "#000000");

    seperation = 20;


    this.renderer.renderText14("Office",
        4,
        seperation * 2,
        "#000000");

    this.renderer.renderText14(": " + this.treatmentData.office,
        100,
        seperation * 2,
        "#000000");


    this.renderer.renderText14("Patient",
        4,
        seperation * 3,
        "#000000");

    this.renderer.renderText14(": " + this.treatmentData.patient,
        100,
        seperation * 3,
        "#000000");


    this.renderer.renderText14("Appoint No.",
        4,
        seperation * 4,
        "#000000");

    this.renderer.renderText14(": " + this.treatmentData.treatmentNumber,
        100,
        seperation * 4,
        "#000000");

    this.renderer.renderText14("Date",
        this.renderer.width / 2,
        seperation * 4,
        "#000000");

    this.renderer.renderText14(": " + this.treatmentData.treatmentDate,
        this.renderer.width / 2 + 120,
        seperation * 4,
        "#000000");

    this.renderer.renderText14("Dentist",
        4,
        seperation * 5,
        "#000000");

    this.renderer.renderText14(": " + this.treatmentData.dentist,
        100,
        seperation * 5,
        "#000000");

};

/**
 * Method to draw a print preview image of the odontogram.
 * This method draws all the teeth in the odotogram.
 * @returns {void}
 */
Engine.prototype.printPreview = function () {

    this.renderer.clear(this.settings);

    this.createHeader();

    this.renderer.render(this.odontAdult, this.settings, this.constants);
    this.renderer.render(this.odontSpacesAdult, this.settings, this.constants);
    this.renderer.render(this.odontChild, this.settings, this.constants);
    this.renderer.render(this.odontSpacesChild, this.settings, this.constants);

    if (this.settings.DEBUG) {

        this.renderer.renderText("DEBUG MODE", 2, 15, "#000000");

        this.renderer.renderText("X: " + this.cursorX + ", Y: " + this.cursorY,
            128, 15, "#000000");
    }

    this.renderer.renderText("Specifications: ", 4, 1200, "#000000");

    this.renderer.wrapText(this.treatmentData.specs, 8, 1222, this.renderer.width - 8, 14, 5);

    this.renderer.renderText("Observations: ", 4, 1300, "#000000");

    this.renderer.wrapText(this.treatmentData.observations, 8, 1322, this.renderer.width - 8, 14, 5);
};

Engine.prototype.print = function () {

    var dataUrl = document.getElementById('canvas').toDataURL();

    var windowContent = '<!DOCTYPE html>';
    windowContent += '<html lang="en">';
    windowContent += '<head>';
    windowContent += '<meta charset="utf-8"/>';
    windowContent += '<title>OIM Odontograma</title>';
    windowContent += '</head>';
    windowContent += '<body >';
    windowContent += '<p style="text-align: center;"><img src="' + dataUrl + '"></p>';
    windowContent += '</body>';
    windowContent += '</html>';

    var printWin = window.open('', '', 'width=' + screen.availWidth + ',height=' + screen.availHeight);
    printWin.document.open();
    printWin.document.write(windowContent);

    printWin.document.addEventListener('load', function () {
        printWin.focus();
        printWin.print();
        printWin.document.close();
        printWin.close();
    }, true);

    this.preview = false;
    this.hidePrintPreview();
};


Engine.prototype.createMenu = function () {

    let buttonWidth = 100;
    let buttonHeight = 20;
    let startX = (this.canvas.width / 2) - ((buttonWidth * 6) / 2);

    let posY = 10;
    let ySeparator = 0;

    let posX = startX;
    let xSeparator = buttonWidth;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Caries", 1);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Crown", 2);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Crown (Tmp)", 3);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Missing", 4);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Fracture", 5);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Diastema", 8);

    posY = posY + buttonHeight + ySeparator;
    posX = startX;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Filling", 11);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Rem Prost", 12);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Drifting", 13);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Rotation", 14);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Fusion", 15);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Root Remnant", 16);

    posY = posY + buttonHeight + ySeparator;
    posX = startX;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Eruption", 24);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Transpositon", 25);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Supernumerary", 27);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Pulp", 20);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Prosthesis", 29);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Bolttt", 30);

    posY = posY + buttonHeight + ySeparator;
    posX = startX;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Fixed Ortho", 32);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Fixed Prosth", 34);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Implant", 6);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Macrodontia", 17);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Microdontia", 10);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Dyschromic", 22);

    posY = posY + buttonHeight + ySeparator;
    posX = startX;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Worn", 37);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Impacted Semi", 30);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Intrusion", 20);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Edentulism", 31);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Ectopic", 21);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Impacted", 19);

    posY = posY + buttonHeight + ySeparator;
    posX = startX;

    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Rem Orthodo", 23);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Extrusion", 9);
    posX = posX + xSeparator;
    this.createMenuButton(posX, posY, buttonWidth, buttonHeight, "Post", 10);

}



Engine.prototype.createMenuButton = function (x, y, width, height, text, id) {
    var menuitem = new MenuItem();
    menuitem.setUp(x, y, width, height);
    menuitem.textBox.text = text
    menuitem.id = id;
    this.menuItems.push(menuitem);

}






/**
 * Base class for tooth
 * @returns {MenuItem}
 */
function MenuItem() {
    "use strict";
    this.active = false;
    this.id = 0;
    this.tooth = true;
    this.surfaces = 0;
    this.highlight = false;
    this.rect = new Rect();
    this.textBox = new TextBox();
    this.spacer = 20; // spacer to seperate tooth from surfaces
    this.touching = false;
    this.address = 0;
    this.normalY = null;
    this.highY = null;
    this.blocked = false;
    this.constants = null;

}


MenuItem.prototype.setUp = function (x, y, width, height) {
    "use strict";

    this.rect.x = x;
    this.rect.y = y;
    this.rect.width = width;
    this.rect.height = height;

    this.textBox.rect.x = x;
    this.textBox.rect.y = y;
    this.textBox.rect.width = width;
    this.textBox.rect.height = height;

};


/**
 * Method to render a Tooth on the screen with all its states
 * @param {type} context the canvas to draw on
 * @param {type} settings app settings
 * @param {type} constants application constants
 * @returns {undefined}
 */
MenuItem.prototype.render = function (context, settings, constants) {
    "use strict";

    if (this.active) {
        this.renderStateActive(context);
    } else {
        this.renderStateNormal(context);
    }

    if (this.highlight) {
        this.renderStateFocus(context);
    }

    this.renderLabel(context);
};


MenuItem.prototype.renderStateNormal = function (context) {
    "use strict";


    var portion = this.rect.height / 5;

    context.beginPath();
    context.globalAlpha = 1;
    context.fillStyle = "#ebf3f5";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, this.rect.height);

    context.fillStyle = "#f9fbfc";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, portion);

    context.fillStyle = "#f9f9f9";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, 1);

    context.fillStyle = "#e5eef1";
    context.fillRect(this.rect.x, this.rect.y + (portion * 4), this.rect.width, portion);

    context.fillStyle = "#e9eef0";
    context.fillRect(this.rect.x, this.rect.y + (this.rect.height - 1), this.rect.width, 1);

    context.globalAlpha = 1;

    this.rect.outline(context, "#35353f")

    context.restore();

};

MenuItem.prototype.renderStateActive = function (context) {
    "use strict";


    var portion = this.rect.height / 5;

    context.beginPath();
    context.globalAlpha = 1;
    context.fillStyle = "#ace8d1";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, this.rect.height);

    context.fillStyle = "#bef7e1";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, portion);

    context.fillStyle = "#dafff1";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, 1);

    context.fillStyle = "#8fd6bb";
    context.fillRect(this.rect.x, this.rect.y + (portion * 4), this.rect.width, portion);

    context.fillStyle = "#6db096";
    context.fillRect(this.rect.x, this.rect.y + (this.rect.height - 1), this.rect.width, 1);

    context.globalAlpha = 1;

    this.rect.outline(context, "#35353f")

    context.restore();

};


MenuItem.prototype.renderStateFocus = function (context) {
    "use strict";

    context.beginPath();
    context.globalAlpha = 0.5;
    context.fillStyle = "#b2dee7";
    context.fillRect(this.rect.x, this.rect.y, this.rect.width, this.rect.height);
    context.globalAlpha = 1.0;
    this.rect.outline(context, "#35353f")
    context.restore();

};

MenuItem.prototype.renderLabel = function (context) {
    "use strict";

    context.globalAlpha = 1;

    context.textAlign = "center";
    context.fillStyle = "#35353f";
    context.font = "13px Arial";

    context.fillText(this.textBox.text,
        this.rect.x + this.rect.width / 2,
        this.rect.y + this.rect.height - 4);

    context.stroke();

    context.restore();
};









//////////////////////////////////////



/* 
* Copyright (c) 2018 Bardur Thomsen <https://github.com/bardurt>.
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*
* Contributors:
*    Bardur Thomsen <https://github.com/bardurt> - initial API and implementation and/or initial documentation
*/

/*
 * Class which represents a simple textbox 
 */

function TextBox() {
    "use strict";
    this.text = "";
    this.rect = new Rect();
    this.touching = false;
}

/**
 * Set the dimension of the rectangle
 * @param {type} x position in canvas
 * @param {type} y position in canvas
 * @param {type} width of rectangle
 * @param {type} height of rectangle
 * @returns {undefined}
 */
TextBox.prototype.setDimens = function (x, y, width, height) {
    "use strict";
    this.rect.x = x;
    this.rect.y = y;
    this.rect.width = width;
    this.rect.height = height;
    this.text = "";
    this.label = "";
};

/**
 * Method to set the text which should be displayed in the textbox
 * @param {type} text string to draw
 * @returns {undefined}
 */
TextBox.prototype.setText = function (text) {
    "use strict";
    this.text = text;
};

TextBox.prototype.setLabel = function (label) {
    "use strict";
    this.label = label;
};

/**
 * Draw a text lable on the textbox
 * @param {type} context
 * @returns {undefined}
 */
TextBox.prototype.drawLabel = function (context) {
    "use strict";
    this.rect.outline(context, "#000000");

    context.beginPath();

    context.textAlign = "center";
    context.fillStyle = "#9a9a9a";
    context.font = "11px Arial";

    context.fillText(this.label,
        this.rect.x + this.rect.width / 2,
        this.rect.y + this.rect.height - 4);

    context.stroke();

    context.restore();

};


////////// I am Badr and i added these two classes here to avoid the exception  ("Classname" is not defined)
//that i face when i call MenuItem and TextBox from the enjine class 
//=> Search for the reasons that why i face this exeption although it works in visual studio blue


/**
 * Draw a text on textbox
 * @param {type} context cavnas to draw on
 * @param {type} color color of the text to draw
 * @returns {void}
 */
TextBox.prototype.drawText = function (context, color) {
    "use strict";
    context.beginPath();

    // if there is text, create a white background
    // to clear the area of the text box
    if (this.text !== "") {
        context.fillStyle = "#ffffff";

        context.fillRect(this.rect.x,
            this.rect.y,
            this.rect.width,
            this.rect.height);

    }

    this.rect.outline(context, "#000000");

    context.textAlign = "center";
    context.fillStyle = color;
    context.font = "13px Arial";

    context.fillText(this.text,
        this.rect.x + this.rect.width / 2,
        this.rect.y + this.rect.height - 4);

    context.stroke();

    context.restore();

};

/**
 * Method to draw the textbox onto a canvas
 * @param {type} context the canvas to draw on
 * @param {type} color the color of the text
 * @returns {undefined}
 */
TextBox.prototype.render = function (context, color) {
    "use strict";
    this.drawText(context, color);
};

TextBox.prototype.setNote = function (note) {
    "use strict";
    this.text = note.toUpperCase();
};
