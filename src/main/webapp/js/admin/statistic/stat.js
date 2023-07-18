let statistics = JSON.parse($('#statistics').val());

// $.get('/stat', function(statistics) {

console.log(statistics);

let dates = statistics.map((item) => {
    return item.endDate;
});

let counts = statistics.map((item) => {
    return item.count;
});

let ctx = document.getElementById('postingChart').getContext('2d');
let chart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: dates,
        datasets: [{
            label: '공고 수',
            data: counts,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


// const ctx = document.getElementById('myChart');
//
// new Chart(ctx, {
//     type: 'bar',
//     data: {
//         labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
//         datasets: [{
//             label: '# of Votes',
//             data: [12, 14, 3, 5, 2, 3],
//             borderWidth: 1
//         }]
//     },
//     options: {
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });