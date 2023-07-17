function defaultSet(){
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth()+1).padStart(2,'0');
    const day = String(today.getDate()).padStart(2,'0');

    const todayDate = `${year}-${month}-${day}`;
    $("#endDate").attr("min", todayDate);

    const selectElements = document.querySelectorAll('select');

    for (const selectElement of selectElements){
        const value = selectElement.getAttribute('data-val');

        for (const option of selectElement.children){
            if (option.getAttribute('value') == value){
                option.selected = true;
            }

        }
    }

    changeSalary();
}