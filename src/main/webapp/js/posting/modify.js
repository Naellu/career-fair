function modifyNumber(number) {
    const length = number.length;
    for (let i = 0; i < length; i++) {
        if (number[i] != '0') {
            return number = number.substring(i);
            break;
        } else {
        }
    }
    return '';

}

function changeSalary(){
    const length = $("#salary").val().length;
    let salary = $("#salary").val();

    let first = salary.substring(0, length - 8);
    if (first != '') {
        first += '억';
    }

    let second = salary.substring(length - 8, length - 4);
    second = modifyNumber(second);
    if (second != '') {
        second += '만';
    }

    let last = salary.substring(length - 4);
    last = modifyNumber(last);
    last += '원';

    salary = first + second + last;

    $("#salaryDetail").text(salary);
}
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

$("#salary").on("keyup", function(){
    changeSalary();
})
