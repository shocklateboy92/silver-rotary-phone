
.pragma library

function parseDate(date) {
    return Date.fromLocaleString(Qt.locale(), date, "ddd dd MMM yyyy HH:mm:ss +0000");
}
