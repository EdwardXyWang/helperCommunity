import React, { PropTypes } from 'react';

export default class Event extends React.Component {

  constructor(props, _railsContext) {
    super(props);
  }

  updateName = (name) => {
    this.setState({ name });
  };

  onWelcome = () =>{
    alert("hello");
  };

  handleClick = ()=>{
    var title = this.refs.title.value;
    var desc = this.refs.description.value;
    var address = this.refs.address.value;
    var city = this.refs.city.value;

  //   $.ajax({
  //     url: '/events',
  //     type: 'POST',
  //     data: {
  //       event: {
  //         title: title,
  //         description: desc,
  //         address: address,
  //         city: city
  //       }
  //     },
  //     success: (response) => {
  //       alert("Event Successfully created");
  //     },
  //     error: (response)=>{
  //       alert("Error creating an event");
  //     }
  //   });
  // };

  render() {
    return (
      <div>
        <h3>Create a New Event</h3>

        <input ref='title' placeholder='Enter the title of the item' />
        <input ref='description' placeholder='Enter a description' />
        <input ref='address' placeholder='Enter address' />
        <input ref='city' placeholder='Enter a city' />
        <button onClick={this.handleClick}>Submit</button>

      </div>
    );
  }
}
