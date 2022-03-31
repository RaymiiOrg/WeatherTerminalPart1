/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3 */

import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 1280
    height: 720
    visible: true

    title: qsTr("WeatherTerminal")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        WeatherPage {}

        SettingsPage {}
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Weather")
            font.pixelSize: 30
        }
        TabButton {
            text: qsTr("Settings")
            font.pixelSize: 30
        }
    }
}
