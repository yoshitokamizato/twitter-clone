import React from 'react'

class Test extends React.Component {
  constructor() {
    super();
    this.state = {
      description: ''
    };
    this.handleSubmitButton = this.handleSubmitButton(this);
    this.handleDescriptionForm = this.handleDescriptionForm(this);
  }
  handleSubmitButton() {
    $.ajax({
      url: '/tweets/create',
      type: 'POST',
      cache: false,
      data: {
        description: this.state.description,
      }
    }).done(function (data, status, xhr) { // success
      console.log(data)
    }.bind(this)).fail(function (xhr, status, data) { // error

    }.bind(this));
  }
  handleDescriptionForm(e) {
    // console.log(data)
    this.setState({
      description: e.target.value
    });
  }
  render() {
    return (
    <div>
      <span>説明</span>
      <input type="text" onChange={this.handleDescriptionForm} />
      <button name="commit" onClick={this.handleSubmitButton}>登録</button>
    </div>
    );
  }
}
    
export default Test;