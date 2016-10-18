
.pragma library

function parseDate(date) {
    if (typeof(date) === 'string') {
        date = date.replace('+0000', 'UTC+00:00');
        console.log("replaced = " + date);
    }

//    return Date.fromLocaleString(Qt.locale(), date, "ddd dd MMM yyyy HH:mm:ss t");
//    return Mome
}
