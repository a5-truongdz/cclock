import QtQuick
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents


PlasmoidItem {
    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    property var source: "crystal-castles"

    function quote() {
        var request = new XMLHttpRequest()
        request.open("GET", Qt.resolvedUrl("../../assets/quotes" + source + ".txt"), false)
        request.send()
        var line = []
        for (var s of request.responseText.split("\n")) {
            s = s.trim()
            if (s.length === 0 || s.startsWith("#")) {
                continue
            } line.push(s)
        } return '"' + line[Math.floor(Math.random() * line.length)] + '"'
    }
    
    FontLoader {
        id: century
        source: "../../assets/fonts/CenturyGothic.otf"
    }

    Timer {
        id: timetimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            time = Qt.formatTime(new Date(), "hh:mm:ss")
            date = Qt.formatDate(new Date(), "- dddd, d MMMM, yyyy -")
        }
    }

    Timer {
        id: quotetimer
        interval: 300000
        running: true
        repeat: true
        onTriggered: {
            quotetext = quote()
        }
    }

    property var time: Qt.formatTime(new Date(), "hh:mm:ss")
    property var date: Qt.formatDate(new Date(), "- dddd, d MMMM, yyyy -")
    property var pos: 90
    property var quotetext: quote()

    PlasmaComponents.Label {
        text: time
        font.family: century.name
        font.pointSize: 72
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    PlasmaComponents.Label {
        text: date
        font.family: century.name
        font.pointSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 50
    }

    PlasmaComponents.Label {
        text: "CRYSTAL CASTLES"
        font.family: century.name
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: pos
        anchors.horizontalCenterOffset: 2
    }

    PlasmaComponents.Label {
        text: "CRYSTAL CASTLES"
        font.family: century.name
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: pos + 12
        anchors.horizontalCenterOffset: -1
    }

    PlasmaComponents.Label {
        text: quotetext
        font.family: century.name
        font.pointSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 116
    }
}