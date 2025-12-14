pragma Singleton
import QtQuick

QtObject {
    property var quoteSource: "crystal-castles"
    property var quoteInterval: 300000
    property var timeFormat: "hh:mm:ss"
    property var dateFormat: "- dddd, d MMMM, yyyy -"
}