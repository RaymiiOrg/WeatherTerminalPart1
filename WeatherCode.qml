

/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3 */
import QtQuick

Item {
    id: root
    height: weatherCodeIcon.height

    property var parameters: undefined

    function weathercodeToIcon(weathercode) {
        switch (weathercode) {
        case 0:
            return "qrc:icons/sun-solid.svg"
        case 1:
        case 2:
        case 3:
            return "qrc:icons/cloud-sun-solid.svg"
        case 45:
        case 48:
            return "qrc:icons/smog-solid.svg"
        case 51:
        case 53:
        case 55:
        case 56:
        case 57:
        case 61:
        case 80:
            return "qrc:icons/cloud-rain.svg"
        case 63:
        case 66:
            return "qrc:icons/cloud-showers-solid.svg"
        case 65:
        case 67:
            return "qrc:icons/cloud-showers-water-solid.svg"
        case 71:
        case 73:
        case 75:
        case 77:
        case 85:
        case 86:
            return "qrc:icons/snowflake-solid.svg"
        case 81:
        case 82:
            return "qrc:icons/cloud-showers-heavy-solid.svg"
        case 95:
        case 96:
        case 99:
            return "qrc:icons/poo-storm-solid.svg"
        default:
            return "qrc:icons/rainbow-solid.svg"
        }
    }

    function weathercodeToText(weathercode) {
        switch (weathercode) {
        case 0:
            return qsTr("Clear sky")
        case 1:
            return qsTr("Mainly clear")
        case 2:
            return qsTr("Partly cloudy")
        case 3:
            return qsTr("Overcast")
        case 45:
            return qsTr("Fog")
        case 48:
            return qsTr("Fog (Depositing rime)")
        case 51:
            return qsTr("Light Drizzle")
        case 53:
            return qsTr("Moderate Drizzle")
        case 55:
            return qsTr("Dense Drizzle")
        case 56:
            return qsTr("Light Freezing Drizzle")
        case 57:
            return qsTr("Dense Freezing Drizzle")
        case 61:
            return qsTr("Slight Rain")
        case 63:
            return qsTr("Moderate Rain")
        case 65:
            return qsTr("Heavy Rain")
        case 66:
            return qsTr("Light Freezing Rain")
        case 67:
            return qsTr("Heavy Freezing Rain")
        case 71:
            return qsTr("Slight Snowfall")
        case 73:
            return qsTr("Moderate Snowfall")
        case 75:
            return qsTr("Heavy Snowfall")
        case 77:
            return qsTr("Snow grains")
        case 80:
            return qsTr("Slight Rainshower")
        case 81:
            return qsTr("Moderate Rainshower")
        case 82:
            return qsTr("Violent Rainshower")
        case 85:
            return qsTr("Slight Snowshowers")
        case 86:
            return qsTr("Heavy Snowshowers")
        case 95:
            return qsTr("Thunderstorm")
        case 96:
            return qsTr("Thunderstorm with slight hail")
        case 99:
            return qsTr("Thunderstorm with heavy hail")
        default:
            return qsTr("Rainbows!")
        }
    }

    Text {
        id: weatherText
        text: qsTr("Current Weather")
        anchors.top: parent.top
        anchors.left: weatherCodeIcon.right
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        font.pixelSize: 18
    }

    Image {
        id: weatherCodeIcon
        source: root.parameters ? weathercodeToIcon(
                                      root.parameters['current_weather']['weathercode']) : "qrc:icons/circle-question-solid.svg"
        asynchronous: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 5
        width: 90
        height: width
    }

    Text {
        id: weatherCodeText
        text: root.parameters ? weathercodeToText(
                                    root.parameters['current_weather']['weathercode']) : "Loading weathercode"

        anchors.bottom: weatherCodeIcon.bottom
        anchors.left: weatherCodeIcon.right
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 50
        wrapMode: Text.WordWrap
    }
}
