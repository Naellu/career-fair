document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/vi/stat/data')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            // data 변수에는 /stat/data 엔드포인트에서 반환한 데이터가 들어있습니다.
            // 이 데이터를 사용하여 차트를 그립니다.
            let dates = data.map(function(item) {
                return item.endDate;
            });

            let counts = data.map(function(item) {
                return item.count;
            });

            // jQuery와 Chart.js를 이용한 차트 그리기
            let ctx = $('#postingChart');
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
        })
        .catch((error) => {
            console.error('Error:', error);
        });
});