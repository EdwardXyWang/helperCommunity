import React, {PropTypes} from 'react';
import Map from '../components/Map';
import NewEvent from '../components/NewEvent';

import ActionCable from 'actioncable';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.name,
      events: []
    };

    this.createEvent = this.createEvent.bind(this);

    this.cable = ActionCable.createConsumer();
    console.log(this.cable);

    this.setupSubscription();
  }

  componentDidMount() {
    this.getEvents();
  }

  getEvents() {
    $.ajax({
      url: "/events",
      dataType: "json"
    }).done((data) => {
      this.setState({ events: data })
    });
  }

  createEvent(eventData) {
    $.ajax({
      url: '/events',
      type: 'POST',
      data: {event: eventData},
      success: (response) => {
        // alert("Event Successfully created");
        console.log(response);
      },
      error: (response)=>{
        // alert("Error creating an event");
        console.log(response);
      }
    });
  }

  render() {
    return (
      <div>
        <NewEvent createEvent={this.createEvent} />
        <Map events={ this.state.events } />
      </div>
    );
  }

  setupSubscription(){

    this.event = this.cable.subscriptions.create("EventChannel", {

      connected: () => {
        console.log("connected??");
      },

      received: (data) => {
        console.log('received', data);
        this.getEvents();
      },

      updateCommentList: this.updateCommentList

    });
    console.log('this.event', this.event);
  }
}