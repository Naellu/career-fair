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

function changeSalary(salary){
    salary = String(salary);

    const length = salary.length;

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

    console.log(salary)
    $("#salary").append(salary);
}