function setDate (){
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;
    $("#startDate").attr("min", formattedDate);

}

$("#startDate").on("change", function() {
    const startDate = $(this).val();
    $("#endDate").attr("min", startDate);
});