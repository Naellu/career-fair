$("#faqForm").submit(function(e) {
    e.preventDefault();  // prevent the form from submitting normally

    let title = $("#faqTitle").val();
    let content = $("#faqContent").val();

    let faqData = {
        title: title,
        content: content
    };

    // faq 추가
    fetch('/faq/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(faqData),
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            throw new Error(response.statusText);
        }
    })
    .then(data => {
        alert(data)
        window.location.reload();
        console.log('Success:', data);
    })
    .catch((error) => {
        alert(error);
        console.error('Error:', error);
    });
});


// faq 수정 - jquery 추가
    fetch('/faq', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(),
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            throw new Error(response.statusText);
        }
    })
    .then(data => {
        alert(data)
        window.location.reload();
        console.log('Success:', data);
    })
    .catch((error) => {
        alert(error);
        console.error('Error:', error);
    });




// faq 삭제 - jquery 추가

    fetch('/faq', {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(faqData),
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            throw new Error(response.statusText);
        }
    })
    .then(data => {
        alert(data)
        window.location.reload();
        console.log('Success:', data);
    })
    .catch((error) => {
        alert(error);
        console.error('Error:', error);
    });