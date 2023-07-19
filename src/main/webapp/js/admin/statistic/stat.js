document.addEventListener("DOMContentLoaded", function() {

    // 마감기한 공고 개수
    fetch('/api/vi/stat/postings')
        .then(response => response.json())
        .then(data => {
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
                        label: '마감 기한 공고 수',
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
                    },
                    maintainAspectRatio :false
                }
            });
        })
        .catch((error) => {
            console.error('Error:', error);
        });


    // ---------------------- //

    // 산업 종류별 공고 개수
    fetch('/api/vi/stat/industry/postings')
        .then(response => response.json())
        .then(data => {
            // 데이터의 industryName들을 추출
            const industryNames = data.map(item => item.industryName);
            // 데이터의 postingCount들을 추출
            const postingCounts = data.map(item => item.count);

            // 색상 배열을 동적으로 생성
            const colors = data.map((item, index) => `hsla(${index * 25}, 70%, 50%, 0.2)`);
            const borderColors = data.map((item, index) => `hsla(${index * 25}, 70%, 50%, 1)`);

            // 차트 그리기
            const ctx = document.getElementById('industryAllPostingChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: industryNames,
                    datasets: [{
                        label: '게시된 채용공고 수',
                        data: postingCounts,
                        // backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        // borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: colors,
                        borderColor: borderColors,
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1,
                                precision: 0
                            }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error:', error));


    // ---------------------- //

    // 산업 종류 별 지원자 수
    fetch('/api/vi/stat/industry/member')
        .then(response => response.json())
        .then(data => {
            // 데이터의 industryName들을 추출
            const industryNames = data.map(item => item.industryName);
            // 데이터의 postingCount들을 추출
            const postingCounts = data.map(item => item.count);

            // 색상 배열을 동적으로 생성
            const colors = data.map((item, index) => `hsla(${index * 25}, 70%, 50%, 0.2)`);
            const borderColors = data.map((item, index) => `hsla(${index * 25}, 70%, 50%, 1)`);

            // 차트 그리기
            const ctx = document.getElementById('industryAllMemberChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: industryNames,
                    datasets: [{
                        label: '게시된 채용공고 수',
                        data: postingCounts,
                        // backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        // borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: colors,
                        borderColor: borderColors,
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1,
                                precision: 0
                            }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error:', error));


    // ---------------------- //

    // 차트를 그릴 컨텍스트
    const ctx = $('#industryAgeGroupChart');

    // 차트 인스턴스를 저장할 변수를 선언
    let myChart;

    // 각 업종마다 나이대 별 지원자 수
    fetch('/api/vi/stat/industry/age')
        .then(response => response.json())
        .then(data => {

            // 데이터의 industryName들을 추출
            const industryNames = [...new Set(data.map(item => item.industryName))];

            // 데이터를 industryName으로 그룹화하고, 각 연령대별 applicantCount를 배열로 만듬
            const groupedData = industryNames.map(industry => {
                const items = data.filter(item => item.industryName === industry);

                return {
                    industry,
                    data: [
                        items.find(item => item.ageGroup === '20대')?.applicantCount || 0,
                        items.find(item => item.ageGroup === '30대')?.applicantCount || 0,
                        items.find(item => item.ageGroup === '40대')?.applicantCount || 0,
                        items.find(item => item.ageGroup === '50대')?.applicantCount || 0,
                        items.find(item => item.ageGroup === '60대 이상')?.applicantCount || 0,
                    ]
                };
            });

            // select box를 채웁니다.
            const industrySelect = document.getElementById('industrySelect');
            industryNames.forEach(name => {
                const option = document.createElement('option');
                option.text = name;
                option.value = name;
                industrySelect.appendChild(option);
            });

            // select box의 변화를 감지하고 차트를 업데이트합니다.
            industrySelect.addEventListener('change', (event) => {
                const selectedIndustry = event.target.value;
                const selectedData = groupedData.find(group => group.industry === selectedIndustry);

                // 기존 차트를 삭제합니다.
                if (myChart) {
                    myChart.destroy();
                }

                // 새로운 차트를 생성합니다.
                myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['20대', '30대', '40대', '50대', '60대 이상'],
                        datasets: [{
                            label: selectedIndustry,
                            data: selectedData.data,
                            // backgroundColor: 'hsla(25, 70%, 50%, 0.5)',
                            // borderColor: 'hsla(25, 70%, 50%, 1)',
                            backgroundColor: 'rgba(142,241,158,0.5)',
                            borderColor: '#BDF7C6FF',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    // y축 눈금 값 정수로 제한
                                    stepSize: 1,
                                    precision: 0
                                }
                            }
                        }
                    }
                });
            });

            // 처음 로드될 때는 첫 번째 업종을 선택한 것으로 간주합니다.
            industrySelect.dispatchEvent(new Event('change'));
        })
        .catch(error => console.error('Error:', error));
});