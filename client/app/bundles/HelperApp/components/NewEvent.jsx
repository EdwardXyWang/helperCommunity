import React, {PropTypes} from 'react';

export default class NewEvent extends React.Component {
  constructor(props) {
    super(props);
    // this.state = defaultState;
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: this.props.name };
    this.handleClick = this.handleClick.bind(this);

  }

  handleClick() {
    var title = this.refs.title.value;
    var desc = this.refs.description.value;
    var scheduled_at = this.refs.scheduled_at.value;
    var address = this.refs.address.value;
    const eventData = {
      title: title,
      description: desc,
      scheduled_at: scheduled_at,
      address: address
    }
    this.props.createEvent(eventData)
  }

  render() {
    return (
      <div>

        <h3>Welcome to Event Management System</h3>

        <input ref='title' placeholder='Enter the Event Title' />
        <input ref='description' placeholder='Enter a Description' />
        <input ref='scheduled_at' placeholder='Enter Event Date' type="datetime-local" name="bday" />
        <input ref='address' placeholder='Enter the Address' />
        <button  onClick={this.handleClick}>Submit</button>

      </div>
    );
  }
}