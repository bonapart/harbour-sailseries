import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: startpage

    SilicaFlickable {
        anchors.fill: parent

        PageHeader {
            id: header
            title: "SailSeries"
        }

        PullDownMenu {

            MenuItem {
                text: "About"
                font.pixelSize: Theme.fontSizeSmall
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }

            MenuItem {
                text: "Search for a series"
                font.pixelSize: Theme.fontSizeSmall
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("SearchPage.qml"))
                }
            }

            MenuItem {
                text: "My series"
                font.pixelSize: Theme.fontSizeSmall
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("MySeriesPage.qml"))
                }
            }

//            MenuItem {
//                text: "TV-Guide"
//                onClicked: pageStack.push(Qt.resolvedUrl("TVguidePage.qml"))
//            }

        }


        SilicaListView {
            id: listView
            height: startpage.height - header.height - 4*Theme.paddingLarge
            width: startpage.width
            anchors.top: header.bottom
            model: controller.TodayModel.TodayModel

            header: TextField {
                text: "Today"
                readOnly: true
                width: listView.width
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeLarge
                visible: listView.count !== 0
            }

            delegate: ListItem {
                id: item
                contentHeight: column.height * 1.1
                contentWidth: listView.width

                Column {
                    id: column
                    x: Theme.paddingLarge

                    Label {
                        id: seriesName
                        text: SeriesName.length === 0 ? text = "SeriesName" : text = SeriesName
                        color: Theme.primaryColor
                    }

                    Label {
                        id: episodeNumber
                        text: "Season " + NextEpisodeSeasonNumber + " Episode " + NextEpisodeNumber
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryColor
                    }

                    Label {
                        id: episodeName
                        text: NextEpisodeName
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryColor
                    }


                    Label {
                        id: network
                        text: AirsTime + " @ " + Network
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryColor
                    }
                }
            }

            VerticalScrollDecorator {
                id: decorator
            }

            TouchBlocker {
                anchors.fill: listView
            }

            ViewPlaceholder {
                enabled: listView.count === 0
                text: "Nothing airs today"
                anchors.centerIn: listView

            }
        }
    }
}

