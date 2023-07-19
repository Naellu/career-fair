$("#faqForm").submit(function(e) {
    e.preventDefault();  // prevent the form from submitting normally

    let title = $("#faqTitle").val();
    let content = $("#faqContent").val();

    let faqData = {
        title: title,
        content: content
    };

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