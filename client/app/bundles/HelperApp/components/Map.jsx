import React, {PropTypes} from 'react';

export default class Map extends React.Component {
  constructor(props) {
    super(props);

    // this.state = defaultState;
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: this.props.name };
    //this.getEvents();
  }

  componentDidMount() {
    console.log('getting events');
    // this.getEvents();
  }

  makeInfoWindowEvent(map, infowindow, contentString, marker) {
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(contentString);
      infowindow.open(map, marker);
    });
  }

  getEvents() {
    const _this = this;
    $.ajax({
      url: "/events",
      dataType: "json"
    }).done(function(data) {
      _this.initMap(data);
    });
  }

  initMap(data) {
    var uluru = {lat: 49.2821004, lng: -123.1082745};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: uluru
    });

    var contentString;

    var infowindow = new google.maps.InfoWindow({
      content: contentString,
      maxWidth: 300
    });

    if (data) {
      for( let i = 0; i < data.length; i++) {
        var marker = new google.maps.Marker({
          position: {lat: data[i]["lat"], lng: data[i]["lng"]},
          map: map
        });

        contentString = '<div class="event-title">' +
                        '<a href = "/events/' + data[i]['id'] + '">' + data[i]['title'] + '</a>' +
                        '<p>' + data[i]['description'] + '</p>'
                        '</div>';

        this.makeInfoWindowEvent(map, infowindow, contentString, marker);
      }
    }
  }

  render() {
    console.log('Loading Map component');
    if(this.props.events.length > 0) {
      this.initMap(this.props.events);
    }
    return (
      <section className="index-map">
        <div className="container">
          <p className="mission">
            Community Enagement Resource,<br />
            for members of the community supporting eachother through goodwill. <br />Beautiful text about our app
          </p>
        </div>

<<<<<<< HEAD
        <div className="map-container">
          <div id="map"></div>
=======
        <div className="columns">
          <div className="column">
            <div id="map"></div>
          </div>
>>>>>>> 0f7889ac57da260037b024b9d23371c638b23224
        </div>


      </section>
    );
  }
}