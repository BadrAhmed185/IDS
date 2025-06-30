document.getElementById('myCases').addEventListener('click', function () {


    let controllerName = document.getElementById('controllerName').value;
    //let keyword = this.value.trim(); // Remove spaces
    let baseUrl = document.getElementById('baseUrl').value;


    // alert(`Badr + ${baseUrl} + badr`);

    fetch(`${baseUrl}${controllerName}/MyCases`)
        .then(response => response.text())
        .then(data => {
            let tableBody = document.getElementById('casesContainer');
            tableBody.innerHTML = data;
        });           
});