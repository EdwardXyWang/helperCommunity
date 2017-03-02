import React, {PropTypes} from 'react';

export default class Map extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.name
    };
  }

  render() {
    console.log('Loading Map component');
    return (
      <section className="index-map">
        <div className="container">
          <p className="mission">
            Community Enagement Resource,<br />
            for members of the community supporting eachother through goodwill. <br />Beautiful text about our app
          </p>
        </div>

        <div className="map-container">
          <div id="map"></div>
        </div>


      </section>
    );
  }
}