

/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3 */
import QtQuick

Item {
    id: root
    height: temperatureIcon.height
    property var parameters: undefined

    function currentHour() {
        const date = new Date()
        return date.getHours()
    }

    Text {
        id: apparentTemperatureText
        text: qsTr("Apparent Temperature")
        anchors.top: parent.top
        anchors.left: temperatureIcon.right
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        font.pixelSize: 18
        minimumPixelSize: 15
    }

    Image {
        id: temperatureIcon
        source: "qrc:icons/temperature-high-solid.svg"
        asynchronous: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 5
        width: 90
        height: width
    }

    property string currentTemperature: root.parameters ? root.parameters['hourly']['apparent_temperature'][currentHour()] : ""
    property string currentTemperatureUnit: root.parameters ? root.parameters['hourly_units']['apparent_temperature'] : ""
    Text {
        id: currentTemperatureText
        text: root.parameters ? currentTemperature + "<small>"
                                + currentTemperatureUnit + "</small>" : "..."

        anchors.bottom: temperatureIcon.bottom
        anchors.left: temperatureIcon.right
        anchors.right: parent.right
        anchors.leftMargin: 20

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 54
        minimumPixelSize: 45
        wrapMode: Text.WordWrap
        textFormat: TextEdit.RichText
    }
}
