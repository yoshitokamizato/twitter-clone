import React from 'react'

class NewTweet extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: ''
    };
    this.getInput = this.getInput.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }
  getInput(e) {
    this.setState({
      tweet: e.target.value
    });
  }
  onSubmit() {
    this.props.onSubmit1(this.state.tweet);
  }
  render() {
    return (
    <div className="new-tweet">
      <textarea onChange={this.getInput}></textarea>
      <button onClick={this.onSubmit}>送信</button>
    </div>
    );
  }
}

export default NewTweet;