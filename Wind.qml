import QtQuick
import QtQuick.Layouts
import "scripts.js" as Scripts

Item {
    id: root
    height: windIcon.height

    property var parameters: undefined
    readonly property int scaleFactor: mainWindow.scaleFactor

    Text {
        id: windText
        text: qsTr("Wind")
        anchors.top: parent.top
        anchors.left: windIcon.right
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        font.pixelSize: 6 * scaleFactor
        minimumPixelSize: 5 * scaleFactor
        wrapMode: Text.WordWrap
    }

    Image {
        id: windIcon
        source: "qrc:icons/wind-solid.svg"
        asynchronous: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 5
        width: 30 * scaleFactor
        height: 30 * scaleFactor
    }

    property string currentWindSpeed: root.parameters ? root.parameters['current_weather']['windspeed'] : ""
    property double currentWindDirection: root.parameters ? root.parameters['current_weather']['winddirection'] : -1
    property string currentWindDirectionString: Scripts.degreesToCompassDirection(
                                                    currentWindDirection)
    property string currentWindSpeedUnit: root.parameters ? root.parameters['hourly_units']['windspeed_10m'] : ""

    Text {
        id: currentWindText
        text: root.parameters ? currentWindSpeed + "<small>" + currentWindSpeedUnit + " "
                                + currentWindDirectionString + "</small>" : "..."

        anchors.bottom: windIcon.bottom
        anchors.left: windIcon.right
        anchors.right: parent.right
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 18 * scaleFactor
        minimumPixelSize: 15 * scaleFactor
        textFormat: TextEdit.RichText
    }

    //    RowLayout {
    //        id: windHours
    //        anchors.right: parent.right
    //        anchors.rightMargin: 20

    //        anchors.bottom: windIcon.bottom
    //        Repeater {
    //            model: [Scripts.Scripts.currentHour() + 1, Scripts.currentHour() + 2, currentHour(
    //                    ) + 3, Scripts.currentHour() + 4]

    //            Text {
    //                Layout.maximumWidth: 50 * scaleFactor
    //                Layout.maximumHeight: 20 * scaleFactor
    //                Layout.leftMargin: 15
    //                text: root.parameters ? "<small>" + modelData + "h:</small> "
    //                                        + root.parameters['hourly']['windspeed_10m'][modelData]
    //                                        + "<small>" + " " + Scripts.degreesToCompassDirection(
    //                                            root.parameters['hourly']['winddirection_10m'][modelData]) + "</small>," : ""
    //                color: root.parameters ? parseFloat(
    //                                             root.parameters['hourly']['windspeed_10m'][modelData])
    //                                         > parseFloat(
    //                                             currentWindSpeed) ? "green" : "red" : "black"
    //                textFormat: TextEdit.RichText
    //                horizontalAlignment: Text.AlignHCenter
    //                verticalAlignment: Text.AlignBottom
    //                font.pixelSize: 12 * scaleFactor
    //                minimumPixelSize: 10 * scaleFactor
    //                wrapMode: Text.WordWrap
    //            }
    //        }
    //    }
}
